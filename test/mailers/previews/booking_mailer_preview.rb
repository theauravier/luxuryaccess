class BookingMailerPreview < ActionMailer::Preview
  def booking_request_confirmation
    booking = Booking.last
    BookingMailer.booking_request_confirmation(booking)
  end

  def new_booking_request
    booking = Booking.last
    BookingMailer.new_booking_request(booking)
  end
end
