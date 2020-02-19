class Attendance < ApplicationRecord
	belongs_to :user
	belongs_to :event
	after_create :new_attendance_send


	def admin
		event.admin
	end

	private
  def new_attendance_send
    UserMailer.new_attendance_email(self).deliver_now
  end
end
