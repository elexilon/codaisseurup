class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  #validates_date :starts_at, on_or_before: lambda { ends_at }
  validates :description, presence: true, length: { maximum: 500 }

  validate :start_must_be_before_end_time

  private

  def start_must_be_before_end_time
      errors.add(:starts_at, "Must be before end time") unless
          starts_at < ends_at
  end
end
