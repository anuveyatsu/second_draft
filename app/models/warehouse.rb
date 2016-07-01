class Warehouse < ActiveRecord::Base
	has_one :warehouse_legal_detail
	has_many :orders
end
