class Store < ActiveRecord::Base
	has_one :store_legal_detail
	has_many :orders
end
