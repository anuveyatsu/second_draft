class Order < ActiveRecord::Base
  belongs_to :seller
  belongs_to :pickup
  belongs_to :warehouse
  has_many :travel_standards
  has_many :travel_premia
  after_initialize :init
  validates_presence_of :buyer_name 
  validates_presence_of :parcel_content
  validates_presence_of :seller_id 
  validates_presence_of :pickup_id
  validates_presence_of :transport_provider
  validates_presence_of :parcel_weight
  validates_presence_of :buyer_phone
  validates_presence_of :parcel_content
  validates_presence_of :delivery_option

  

  def init
    self.delivery_status ||= "processing" #will set the default value only if it's null
  end
end
