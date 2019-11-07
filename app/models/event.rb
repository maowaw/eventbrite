class Event < ApplicationRecord

#LIENS AVEC LES AUTRES MODELS----------------------------

	has_many :attendances
	has_many :users, through: :attendances

	belongs_to :admin, class_name: "User"

	has_one_attached :avatar

#VALIDATIONS---------------------------------------------	

	validates :start_date, presence: true
	
	#la date ne peut être antérieur à la date du jour
	validate :start_date_cannot_be_in_the_past


	def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  #durée multiple de 5 et supérieur à 0
  validate :duration_is_positive_and_5_multiple

  def duration_is_positive_and_5_multiple
  	if duration != % 5 && duration <= 0
  		errors.add(:duration, "must be multiple of 5 and higher than 0")
  	end
  end

	validates :duration, presence: true
	validates :title, presence: true, length: { in: 5..140 }
	validates :description, presence: true
	validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 1000 }
	validates :location, presence: true

end


