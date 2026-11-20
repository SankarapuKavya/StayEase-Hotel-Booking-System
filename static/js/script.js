document.addEventListener("DOMContentLoaded", function () {

    // Automatically close Django message alerts after 5 seconds.
    const alerts = document.querySelectorAll(".alert");

    alerts.forEach(function (alert) {
        setTimeout(function () {
            if (alert.classList.contains("show")) {
                const closeButton = alert.querySelector(".btn-close");

                if (closeButton) {
                    closeButton.click();
                }
            }
        }, 5000);
    });

    // Ensure check-out is after check-in.
    const checkIn = document.querySelector('input[name="check_in"]');
    const checkOut = document.querySelector('input[name="check_out"]');

    if (checkIn && checkOut) {
        checkIn.addEventListener("change", function () {
            if (checkIn.value) {
                checkOut.min = checkIn.value;

                if (checkOut.value && checkOut.value <= checkIn.value) {
                    checkOut.value = "";
                }
            }
        });
    }

});