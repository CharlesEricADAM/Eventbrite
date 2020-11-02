class Event < ApplicationRecord
  validates :start_date, presence:true, if: :future_date
  validates :duration, presence:true, numericality: { greater_than: 0}, if: :multiple_5?
  validates :title, presence:true, length: { minimum: 5 , maximum: 140}
  validates :description, presence:true, length: { minimum: 20 , maximum: 1000}
  validates :price, presence:true, :inclusion => 1..1000
  validates :location, presence:true

  has_many :users, through: :attendances
  has_many :attendances
  belongs_to :event_admin, class_name: "User"

  def multiple_5?
    errors.add(:duration, "must be a multiple of 5") if
    duration % 5 != 0
  end
  
  def future_date
      errors.add(:start_date, "Event can't be in the past") if
      start_date < Date.today     
  end
end 
