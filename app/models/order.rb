class Order < ActiveRecord::Base
  belongs_to :seller
  belongs_to :buyer
  belongs_to :store
  belongs_to :warehouse
  has_many :travel_standards
  has_one :travel_premium 
end
