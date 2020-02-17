class Event < ApplicationRecord
	validates :start_date, presence: true
	validates :duration, presence: true
	validates :title, presence: true, length: { in: 5..140, message: "title need 5 car. min and 140 car. max"}
	validates :description, presence: true, length: { in: 20..1000, message: "description need 20 car. min and 1000 car. max"}
	validates :price, presence: true, numericality: { in: 1..1000, }
	has_many :attendances
	has_many :users, through: :attendance 
	belongs_to :admin, class_name: "User", required: false
end
