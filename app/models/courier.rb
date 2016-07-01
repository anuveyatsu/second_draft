class Courier < ActiveRecord::Base
	has_one :courier_legal_detail
	has_one :travel_standard
	has_one :travel_premium
end
