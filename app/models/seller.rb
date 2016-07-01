class Seller < ActiveRecord::Base
	has_many :transactions 
	has_one :seller_legal_detail
	has_many :buyers
	has_many :orders
end
