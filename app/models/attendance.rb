class Attendance < ApplicationRecord
  after_create :new_participant_send

  validates :user, presence: true
  validates :event, presence: true

  belongs_to :user
  belongs_to :event

  def new_participant_send
    UserMailer.new_participant_email(self.event.admin).deliver_now
  end
end
