from django.db import models


class Hotel(models.Model):

    name = models.CharField(max_length=200)

    city = models.CharField(max_length=100)

    address = models.TextField()

    description = models.TextField()

    image = models.ImageField(
        upload_to='hotels/',
        blank=True,
        null=True
    )

    contact_number = models.CharField(max_length=15)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name


class RoomType(models.Model):

    hotel = models.ForeignKey(
        Hotel,
        on_delete=models.CASCADE,
        related_name='rooms'
    )

    name = models.CharField(max_length=100)

    description = models.TextField()

    price_per_night = models.DecimalField(
        max_digits=10,
        decimal_places=2
    )

    total_rooms = models.PositiveIntegerField(default=1)

    capacity = models.PositiveIntegerField(default=2)

    image = models.ImageField(
        upload_to='rooms/',
        blank=True,
        null=True
    )

    def __str__(self):
        return f"{self.name} - {self.hotel.name}"