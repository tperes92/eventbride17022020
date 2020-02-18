require 'user_mailer'

class User < ApplicationRecord
after_create :welcome_send
	has_many :attendances
	has_many :events, through: :attendance
	has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"

def welcome_send
    UserMailer.welcome_email(self).deliver_now
end

end
