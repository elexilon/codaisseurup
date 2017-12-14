class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  BARGAIN_PRICE = 30

  validates :name,        presence: true, length: { maximum: 255 }
  validates :location,    presence: true, length: { maximum: 50 }
  validates :starts_at,   presence: true
  validates :ends_at,     presence: true
  validates :price,       presence: true
  validates :capacity,    presence: true
  #validates :active,      presence: true
  validates :description, presence: true, length: { maximum: 500 }

  validate :start_must_be_before_end_time

  def correct_date?
    starts_at.strftime("%m/%d/%Y") < ends_at.strftime("%m/%d/%Y")
  end

  def bargain?
    price < BARGAIN_PRICE
  end

  def self.order_by_price
    order :price
  end

  private

  def start_must_be_before_end_time
      errors.add(:starts_at, "Must be before end time") unless
          correct_date?
  end

end
