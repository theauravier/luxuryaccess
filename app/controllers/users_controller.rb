class UsersController < ApplicationController
  before_action :set_user, except: :dashboard
  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @item_bookings = @user.item_bookings
    @items = @user.items
    @sales = @user.item_bookings
    @owner = @user.bookings
    @customer = @user.item_bookings
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private
   def set_user
    @user = User.find(params[:id])
  end
end
