class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @item = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_description, :category_id, :status_id, :delivery_id, :area_id, :duration_id, :selling_price).merge(user_id: current_user.id)
  end

end
