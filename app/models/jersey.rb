class Jersey < ApplicationRecord
  has_many :orders
  belongs_to :user
  
  validates :size, presence: true
end
