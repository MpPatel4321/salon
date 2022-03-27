class AppointmentsController < ApplicationController

	def show
		@appointment = Appointment.find(params[:id])
	end

	def new
		@booked_appointments = Appointment.where(shop_id: params[:shop_id])
		@services = Service.where(shop_id: params[:shop_id])
		@shop_id = params[:shop_id]
		@appointment = Appointment.new
	end

	def create
	  @appointment = Appointment.create(appointment_params)
	  if @appointment.save
	    redirect_to appointment_path(@appointment)
	  else
	    render :new 
	  end
	end

	private

  def appointment_params
    params.require(:appointment).permit(:on_time, :off_time, :service_id, :shop_id, :user_id)
  end

end
