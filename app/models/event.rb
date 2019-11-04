class Event < ApplicationRecord

	has_many :attendances
	has_many :users, through: :attendances

	belongs_to :admin, class_name: "User"


end
