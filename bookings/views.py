from datetime import date
from decimal import Decimal

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.shortcuts import render, redirect, get_object_or_404
from django.utils import timezone

from hotels.models import RoomType
from .models import Booking


@login_required
def create_booking(request, room_type_id):
    room_type = get_object_or_404(
        RoomType.objects.select_related('hotel'),
        id=room_type_id
    )

    if request.method == 'POST':
        check_in_value = request.POST.get('check_in')
        check_out_value = request.POST.get('check_out')
        guests_value = request.POST.get('guests')

        try:
            check_in = date.fromisoformat(check_in_value)
            check_out = date.fromisoformat(check_out_value)
            guests = int(guests_value)
        except (TypeError, ValueError):
            messages.error(request, 'Please enter valid booking details.')
            return redirect(
                'bookings:create_booking',
                room_type_id=room_type.id
            )

        today = timezone.localdate()

        if check_in < today:
            messages.error(request, 'Check-in cannot be in the past.')

        elif check_out <= check_in:
            messages.error(
                request,
                'Check-out must be after check-in.'
            )

        elif guests < 1 or guests > room_type.capacity:
            messages.error(
                request,
                f'This room allows 1 to {room_type.capacity} guests.'
            )

        else:
            with transaction.atomic():
                locked_room = RoomType.objects.select_for_update().get(
                    id=room_type.id
                )

                overlapping_bookings = Booking.objects.filter(
                    room_type=locked_room,
                    status__in=['Pending', 'Confirmed'],
                    check_in__lt=check_out,
                    check_out__gt=check_in
                ).count()

                if overlapping_bookings >= locked_room.total_rooms:
                    messages.error(
                        request,
                        'Sorry, no rooms are available for those dates.'
                    )
                else:
                    nights = (check_out - check_in).days
                    total_price = (
                        locked_room.price_per_night * Decimal(nights)
                    )

                    booking = Booking.objects.create(
                        user=request.user,
                        room_type=locked_room,
                        check_in=check_in,
                        check_out=check_out,
                        guests=guests,
                        total_price=total_price,
                        status='Confirmed'
                    )

                    messages.success(
                        request,
                        f'Your booking #{booking.id} has been confirmed.'
                    )

                    return redirect('bookings:my_bookings')

        return redirect(
            'bookings:create_booking',
            room_type_id=room_type.id
        )

    return render(request, 'bookings/booking_form.html', {
        'room_type': room_type,
        'today': timezone.localdate(),
    })


@login_required
def my_bookings(request):
    bookings = Booking.objects.filter(
        user=request.user
    ).select_related(
        'room_type',
        'room_type__hotel'
    ).order_by('-created_at')

    return render(request, 'bookings/my_bookings.html', {
        'bookings': bookings,
        'today': timezone.localdate(),
    })


@login_required
def cancel_booking(request, booking_id):
    booking = get_object_or_404(
        Booking,
        id=booking_id,
        user=request.user
    )

    if request.method == 'POST':
        if booking.status == 'Cancelled':
            messages.info(request, 'This booking is already cancelled.')

        elif booking.check_in <= timezone.localdate():
            messages.error(
                request,
                'Bookings cannot be cancelled on or after check-in day.'
            )

        else:
            booking.status = 'Cancelled'
            booking.save(update_fields=['status'])

            messages.success(request, 'Your booking has been cancelled.')

    return redirect('bookings:my_bookings')