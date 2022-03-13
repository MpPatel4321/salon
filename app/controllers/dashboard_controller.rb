class DashboardController < ApplicationController
  #before_action :authenticate_user!
  def index
  end
  def owner_sign_up
    @admin_email = User.find_by(role: "admin").email
    @otp = rand(100000..999999)
    OtpMailer.otp_email(@admin_email, @otp).deliver_later
  end
end
