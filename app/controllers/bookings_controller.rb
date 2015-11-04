class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:item_id])
    @booking = Booking.new(params_bookings)
    @booking.save
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def params_bookings
    params.require(:booking).permit(:start_day, :end_day, :item_id)
  end

end
