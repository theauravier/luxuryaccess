class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :destroy, :edit]
  def index
    @items = Item.all
  end

  def show
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
    else
      render :new
    end
  end

  def edit
  end

  def update
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
