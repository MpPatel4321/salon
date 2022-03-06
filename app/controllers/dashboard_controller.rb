class DashboardController < ApplicationController
  #before_action :authenticate_user!
  def index
  end
  def owner_sign_up
    @admin_email = User.find_by(role: "admin").email
  end
end
