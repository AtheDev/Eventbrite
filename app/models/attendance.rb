class Attendance < ApplicationRecord
  after_create :new_participant_send

  validates :user, presence: true
  validates :event, presence: true
  #validates :stripe_customer_id, presence: true

  belongs_to :user
  belongs_to :event
  #belongs_to :stripe_customer_id

  def new_participant_send
    UserMailer.new_participant_email(self.event.admin).deliver_now
  end
end
