class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :product

	has_many :cats
	has_many :products, :through => :cats

end
