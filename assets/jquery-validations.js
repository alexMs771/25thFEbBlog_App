// jQuery Form Validation Utilities

$(document).ready(function () {
    // Centralized message handling
    function showMessage(message, type) {
        const msgClass = type === 'error' ? 'alert-danger' : 'alert-success';
        $('#messageContainer').html(`<div class='alert ${msgClass}'>${message}</div>`);
    }

    // Validate email
    $.fn.validateEmail = function () {
        this.on('blur', function () {
            const email = $(this).val();
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                showMessage('Invalid email address.', 'error');
                $(this).addClass('is-invalid');
            } else {
                $(this).removeClass('is-invalid');
                showMessage('Email is valid.', 'success');
            }
        });
        return this;
    };

    // Validate required fields
    $.fn.validateRequired = function () {
        this.on('blur', function () {
            if ($(this).val().trim() === '') {
                showMessage('This field is required.', 'error');
                $(this).addClass('is-invalid');
            } else {
                $(this).removeClass('is-invalid');
                showMessage('Field is filled.', 'success');
            }
        });
        return this;
    };

    // Form submission handler
    $('#myForm').on('submit', function (event) {
        event.preventDefault();
        const emailValid = $('#emailInput').validateEmail();
        const requiredValid = $('#requiredInput').validateRequired();
        if (emailValid && requiredValid) {
            showMessage('Form submitted successfully!', 'success');
        } else {
            showMessage('Please correct the errors before submitting.', 'error');
        }
    });
});
