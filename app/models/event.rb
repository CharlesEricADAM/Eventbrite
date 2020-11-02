class Event < ApplicationRecord
  validates :start_date, presence:true, if: :start_date_cannot_be_in_the_past
  validates :duration, presence:true, numericality: { greater_than: 0}, if: :multiple_5?
  validates :title, presence:true, length: { minimum: 5 , maximum: 140}
  validates :description, presence:true, length: { minimum: 20 , maximum: 1000}
  validates :price, presence:true, :inclusion => 1..1000
  validates :location, presence:true

  has_many :attendances
  has_many :participants, class_name: "User", through: :attendances
  belongs_to :administrator, class_name: "User"

  def multiple_5?
    errors.add(:duration, "must be a multiple of 5") if
    duration % 5 != 0
  end
  def start_date_cannot_be_in_the_past
      errors.add(:start_date, "can't be in the past") if
      start_date < Date.today     
  end
end 
