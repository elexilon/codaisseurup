class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates_date :starts_at, on_or_before: lambda { ends_at }
  validates :description, presence: true, length: { maximum: 500 }
end
