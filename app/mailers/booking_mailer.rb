class BookingMailer < ApplicationMailer
  def booking_request_confirmation(booking)
    @booking = booking

    mail(
      to:       @booking.customer.email,
      subject:  "Booking request send to the owner, thanks #{@booking.customer.first_name}"
    )
  end

  def new_booking_request(booking)
    @booking = booking

    mail(
      to:       @booking.item.owner.email,
      subject:  "You have a new booking request !"
    )
  end
end
