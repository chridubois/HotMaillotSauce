class Jersey < ApplicationRecord
  has_many :orders
  belongs_to :user

  validates :team, :year, :state, :photo, :price_per_day, :user, :seller_address, :size, presence: true, allow_nil: false, allow_blank: false
  validates :year, numericality: { only_integer: true }
  # validates :size, inclusion: { in: %w[small medium large],
  #   message: "%{value} is not a valid size" }
  validates :price_per_day, numericality: { greater_than: 0 }
end
