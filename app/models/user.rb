class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jerseys
  has_many :orders

  # validates :email, :firstname, :lastname, :password, :team, :avatar, :phone_number, seller_address, presence: true
end
