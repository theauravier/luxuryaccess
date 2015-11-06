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
    @booking.status = "Waiting"
    if @booking.save
      redirect_to item_booking_path(@item, @booking)
      BookingMailer.booking_request_confirmation(@booking).deliver_now
      BookingMailer.new_booking_request(@booking).deliver_now
    else
      redirect_to :back
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @item = @booking.item
    @owner = @booking.owner
    @customer = @booking.customer
  end

  def update
    @booking = Booking.find(params[:id])
    @item = @booking.item
    @owner = @booking.owner
    @customer = @booking.customer
    if @booking.update(params_bookings_answer)
      if @booking.status == "Accept"
        redirect_to users_dashboard_path
      else
        redirect_to users_dashboard_path
      end
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def params_bookings
    params.require(:booking).permit(:start_day, :end_day)
  end

  def params_bookings_answer
    params.require(:booking).permit(:start_day, :end_day, :status)
  end

end
