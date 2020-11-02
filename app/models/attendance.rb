class Attendance < ApplicationRecord
  after_create :attendance_send

  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true

  def attendance_send
    event = self.event
    event_admin = event.event_admin
    UserMailer.attendance_email(event_admin, event).deliver_now
  end
end
