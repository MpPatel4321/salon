class Service < ApplicationRecord
	belongs_to :shop
	has_many :appointments, dependent: :destroy
end
