class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true,
    numericality: {only_integer: true, other_than: 0}
  validate :duration_multiple_5
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

  def start_date_cannot_be_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "Date  invalide")
    end
  end

  def duration_multiple_5
    if duration / 5 != 0
      errors.add(:duration, "Durée non valide, 5 min par 5 min")
    end
end
