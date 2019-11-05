class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


#liens avec les autres tables
	has_many :attendances
	has_many :events, through: :attendances

#validations
	validates :email, presence: true, uniqueness: true
	validates :description, presence: true, length: { minimum: 1, maximum: 1000}
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :password, presence: true, length: { minimum: 1}

  
end
