class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @bookings = @user.bookings
    @items = @items.user
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
