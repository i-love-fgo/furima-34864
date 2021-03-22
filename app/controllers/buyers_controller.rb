class BuyersController < ApplicationController
  before_action :authenticate_user!, except: index

  def index
    @buyer = Buyer.new
  end
  
  def new
  end

  def create
  end

end