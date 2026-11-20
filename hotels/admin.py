from django.contrib import admin
from .models import Hotel, RoomType


class RoomTypeInline(admin.TabularInline):
    model = RoomType
    extra = 1


@admin.register(Hotel)
class HotelAdmin(admin.ModelAdmin):

    list_display = ('name', 'city', 'contact_number')

    search_fields = ('name', 'city')

    list_filter = ('city',)

    inlines = [RoomTypeInline]


@admin.register(RoomType)
class RoomTypeAdmin(admin.ModelAdmin):

    list_display = (
        'name',
        'hotel',
        'price_per_night',
        'total_rooms',
        'capacity'
    )

    list_filter = ('hotel',)