class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jerseys
  has_many :orders

  validates :email, :firstname, :lastname, :password, :team, :phone_number, :seller_address, presence: true

  geocoded_by :seller_address
  after_validation :geocode, if: :will_save_change_to_seller_address?

  def my_profit
    @my_profit = 0
    jerseys.each do |jersey|
      jersey.orders.each do |order|
        @my_profit += order.total_amount
      end
    end
    return @my_profit
  end
end
