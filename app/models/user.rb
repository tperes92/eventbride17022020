class User < ApplicationRecord
	has_many :attendances
	has_many :events, through: :attendance
	has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
end
