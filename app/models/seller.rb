class Seller < ActiveRecord::Base
  has_many :transactions
  has_one :seller_legal_detail
  has_many :buyers
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
