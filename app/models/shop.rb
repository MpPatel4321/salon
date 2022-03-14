class Shop < ApplicationRecord
	belongs_to :user

	validates_presence_of :shop_name
  validates_presence_of :chairs
  validates_presence_of :opening_time
  validates_presence_of :closing_time
  
  # validate :unique_shop

  # private

  # def unique_shop
  #   errors.add :base, "you not create more than one shop" unless self.user.shop.id.nil?
  # end
end
