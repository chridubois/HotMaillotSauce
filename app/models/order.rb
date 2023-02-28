class Order < ApplicationRecord
  belongs_to :user
  belongs_to :jersey

  validates :begin_date, :end_date, :jersey, :user, presence: true, allow_nil: false, allow_blank: false
end
