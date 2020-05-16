class Event < ApplicationRecord

  validate :start_date_cannot_be_in_the_past

  validate :duration_must_be_multiple_of_five

  validates :title, presence: true,
    length: { in: 5..140}

  validates :description, presence: true,
    length: { in: 20..1000}

  validates :price, presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 1000}

  validates :location, presence: true

  has_one_attached :picture
  belongs_to :admin, class_name: "User"
  has_many :attendances
  has_many :users, through: :attendances


  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Can't be in the past")
    end
  end

  def duration_must_be_multiple_of_five
    if duration.present? && duration % 5 != 0 && duration <= 0 && duration.class != Integer
      errors.add(:duration, "Must be multiple of five")
    end
  end

  def end_date
    self.start_date + duration.minutes
  end

  def is_free
    price == 0
  end

end
