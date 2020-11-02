class User < ApplicationRecord
  after_create :welcome_send
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  has_many :attendances
  has_many :events, through: :attendances
  has_many :admin_events, foreign_key: "event_admin_id", class_name: "Event", dependent: :destroy

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
