class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable, stretches: 12
  has_many :products
  has_one :profile
  validates :first_name, presence: true
  validates :last_name, presence: true 
  # has_many :orders, :dependent => :destroy
  # has_many :products, through: :orders
end
