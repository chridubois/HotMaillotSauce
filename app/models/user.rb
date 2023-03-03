class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jerseys
  has_many :orders

  validates :email, :firstname, :lastname, :password, :team, :phone_number, :seller_address, presence: true

  def my_orders
    @jerseys.each do |jersey|
      @my_orders << jersey.orders
    end
    return @my_orders
  end

  def my_profit
    # @user =
    # @jerseys.each do |jersey|
    #   jersey.orders.each do |order|
    #     @my_profit += order.total_amount
    #   end
    # end
    # return @my_profit
  end
end
