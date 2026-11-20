from django.shortcuts import render, get_object_or_404
from django.db.models import Q
from .models import Hotel


def home(request):
    featured_hotels = Hotel.objects.all().order_by('-created_at')[:6]

    return render(request, 'home.html', {
        'featured_hotels': featured_hotels
    })


def hotel_list(request):
    hotels = Hotel.objects.all().order_by('name')

    city = request.GET.get('city', '').strip()
    search_query = request.GET.get('q', '').strip()

    if city:
        hotels = hotels.filter(city__icontains=city)

    if search_query:
        hotels = hotels.filter(
            Q(name__icontains=search_query) |
            Q(city__icontains=search_query) |
            Q(address__icontains=search_query)
        )

    return render(request, 'hotels/hotel_list.html', {
        'hotels': hotels,
        'city': city,
        'search_query': search_query,
    })


def hotel_detail(request, hotel_id):
    hotel = get_object_or_404(Hotel, id=hotel_id)
    room_types = hotel.rooms.all().order_by('price_per_night')

    return render(request, 'hotels/hotel_detail.html', {
        'hotel': hotel,
        'room_types': room_types,
    })