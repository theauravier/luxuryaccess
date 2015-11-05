class BookingsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:item_id])
    @owner = User.find(@item.owner_id)
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @item = Item.find(params[:item_id])
    @owner = User.find(@item.owner_id)
    @booking = @item.bookings.new(params_bookings)
    @booking.start_day = DateTime.strptime(params[:booking][:start_day], '%m/%d/%Y').to_date
    @booking.end_day = DateTime.strptime(params[:booking][:end_day], '%m/%d/%Y').to_date
    @booking.item_id = @item.id
    @booking.customer = current_user
    if @booking.save
      redirect_to item_booking_path(@item, @booking)
    else
      redirect_to :back
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
  def params_bookings
    params.require(:booking).permit(:start_day, :end_day)
  end

end
