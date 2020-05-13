class Event < ApplicationRecord

  validate :start_date_not_in_the_past
  validate :duration_multiple
  validates :title, presence: true,
    length: { in: 5..140}
  validates :description, presence: true,
    length: { in: 20..1000}
  validates :price, presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000, message: "Doit être compris entre 1€ et 1000€"}
  validates :location, presence: true

  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances


  private

    def start_date_not_in_the_past
      errors.add(:start_date, "The event can't be in the past.") if start_date < Time.now
    end

    def duration_multiple
      errors.add(:duration, "Choose a duration which is multiple of 5.") unless duration % 5 == 0
    end
end
