class ServicesController < ApplicationController

	def show
		byebug
	end

	def new
		@service = Service.new
	end

  def create
    @service = Service.create(service_params)
    if @service.save
      redirect_to shop_path(@service.shop)
    else
      render :new 
    end
  end

	private

  def service_params
    params.require(:service).permit(:service_name, :price, :taken_time, :shop_id)
  end
end
