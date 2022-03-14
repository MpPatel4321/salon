class ShopsController < ApplicationController
  def index
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new 
    end
  end

  def edit
  end

  def show
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :user_id, :chairs, :opening_time, :closing_time)
  end
end
