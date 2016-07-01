class Buyer < ActiveRecord::Base
  belongs_to :seller
  has_one :buyer_legal_detail
  has_many :orders
end
