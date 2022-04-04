class Appointment < ApplicationRecord
	belongs_to :user
	belongs_to :shop
	belongs_to :service
end
