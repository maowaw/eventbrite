class Attendance < ApplicationRecord

	belongs_to :user
	belongs_to :event

after_create :participation_send

  def participation_send
    # AttendanceMailer.participation_email(self).deliver_now
  end


end
