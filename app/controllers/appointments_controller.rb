class AppointmentsController < ApplicationController

	def show
		@appointment = Appointment.find(params[:id])
	end

	def new
		@booked_appointments = Appointment.where(shop_id: params[:shop_id])
		@services = Service.where(shop_id: params[:shop_id])
		@shop = Shop.find(params[:shop_id])
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

	def set_on_time
		service = Service.find(params[:id])
		booked_appointments = Appointment.where(shop_id: service.shop_id)
		if booked_appointments
			ot = service.shop.opening_time
			ct = service.shop.closing_time
			tt = service.taken_time.strftime("%H:%M").split(":")
			tt = (tt[0].to_i * 3600) + (tt[1].to_i * 60)
			@on_times = [ot]
			loop do
	 			ot = ot + tt
				if ot != ct
	 				@on_times << ot
	 			else
	 				break
	 			end
			end
			# byebug
		end
	end

	def set_off_time
		service = Service.find(params[:id])
		tt = service.taken_time.strftime("%H:%M").split(":")
		tt = (tt[0].to_i * 3600) + (tt[1].to_i * 60)
		@off_time = params[:on_time].to_time + tt
	end

	private

  def appointment_params
    params.require(:appointment).permit(:on_time, :off_time, :service_id, :shop_id, :user_id)
  end

end
