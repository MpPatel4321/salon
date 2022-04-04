class DashboardController < ApplicationController
  #before_action :authenticate_user!
  def index
    @shops = Shop.all
  end

  def owner_sign_up
    @admin_emails = User.where(role: "admin").pluck(:email)
    @otp = rand(100000..999999)
    @admin_emails.each do |email|
      OtpMailer.otp_email(email, @otp).deliver_later
    end
  end
end
