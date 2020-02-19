class Event < ApplicationRecord
  validates :start_date, :duration, :title, :description, :price, :location, presence: :true
  validate :cant_be_past
  validate :duration_5_pos
  validates :title, length: { in: 5..140}
  validates :description, length: { in: 20..1000 }
  validate :price_validation
  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :users, through: :attendances

  def self.convert_date_time(date, time)
    (date.to_s + " " +time.to_s).to_datetime
  end

  def duration_display
    duration < 59 ? duration.to_s + " mins" : (duration/60).to_s + "h+"
  end

  def end_date
    start_date + duration * 60
  end

  private 
  
  def cant_be_past
    if start_date.nil?
      errors.add(:start_date, "must be filled") 
    else
      errors.add(:start_date, "cant be past") if start_date < Time.now
    end
  end
  
  def duration_5_pos
    if duration.nil?
      errors.add(:duration, "must be filled") 
    else
      errors.add(:duration, "has to be a multiple of 5") unless duration % 5 == 0
      errors.add(:duration, "has to be a positive amount of minutes") unless duration > 0
    end
  end

  def price_validation
    if price.nil?
      errors.add(:price, "must be filled") 
    else
      errors.add(:price, "cant be free") if price < 1
      errors.add(:price, "cant be over 1000") if price > 1000
    end
  end
end