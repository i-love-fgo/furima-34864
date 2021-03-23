class BuyersController < ApplicationController

  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :area_id, :municipality, :house_number, :building_name, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id)
  end

end