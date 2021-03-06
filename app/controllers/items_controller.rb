class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  before_action :find_item, only: [:show, :destroy, :edit, :update]
  def index
    if params.has_key? "category"
        @items = Item.where(category: params["category"])
      if params.has_key? "max_price"
        @items = @items.where('daily_price < ?', params["max_price"])
      end
    else
      @items = Item.all
    end

  end

  def show
    @booking = Booking.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.owner_id = current_user.id if current_user
    if @item.save
      flash[:notice] = "#{@item.title} has been created"
      redirect_to item_path(@item)
      ItemMailer.add_confirmation(@item).deliver_now
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
  end


  def destroy
    @item = Item.destroy(find_item)
    flash[:notice] = "#{@item.title} has been deleted"
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :daily_price, :description, :category, :brand, :city, :picture)
  end
  def find_item
    @item = Item.find(params[:id])
  end
end
