from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import login


def register(request):
    if request.user.is_authenticated:
        return redirect('hotels:home')

    if request.method == 'POST':
        form = UserCreationForm(request.POST)

        if form.is_valid():
            user = form.save()
            login(request, user)

            messages.success(
                request,
                'Your StayEase account has been created successfully.'
            )

            return redirect('hotels:home')
    else:
        form = UserCreationForm()

    return render(request, 'accounts/register.html', {
        'form': form
    })