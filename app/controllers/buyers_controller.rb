class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.selling_price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @buyer_address.present? || ( current_user.id == @item.user_id )
      redirect_to root_path
    end
  end

end