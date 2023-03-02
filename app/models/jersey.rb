class Jersey < ApplicationRecord
  has_many :orders
  belongs_to :user
  # has_one :user, through: :order

  validates :team, :year, :state, :photo, :price_per_day, :user, :size, presence: true
  validates :price_per_day, numericality: { greater_than: 0 }
end
