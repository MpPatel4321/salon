# frozen_string_literal: true

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
    @on_times = find_on_time(service, booked_appointments)
  end

  def set_off_time
    service = Service.find(params[:id])
    tt = service.taken_time.strftime('%H:%M').split(':')
    tt = (tt[0].to_i * 3600) + (tt[1].to_i * 60)
    @off_time = params[:on_time].to_time + tt
  end

  private

  def find_on_time(service, appointments)
    ot = service.shop.opening_time
    ct = service.shop.closing_time
    on_times = appointments.pluck(:on_time)
    off_times = appointments.pluck(:off_time)
    taken_time = service.taken_time.strftime('%H:%M').split(':')
    taken_time = (taken_time[0].to_i * 3600) + (taken_time[1].to_i * 60)
    tt = 1800
    on_times_a = [ot]
    on_times_aa = []
    loop do
      ot += tt
      ot != ct ? on_times_a << ot : break
    end

    (0...on_times_a.length).each do |i|
      t = 0
      oft = on_times_a[i] + taken_time
      (0...on_times.length).each do |j|
        if (on_times_a[i] >= on_times[j] && on_times_a[i] < off_times[j]) || (oft > on_times[j] && oft < off_times[j])
          t += 1
        end
      end
      on_times_aa << on_times_a[i] if t >= service.shop.chairs
    end
    on_times_a - on_times_aa
  end

  def appointment_params
    params.require(:appointment).permit(:on_time, :off_time, :service_id, :shop_id, :user_id)
  end
end
