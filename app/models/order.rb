class Order < ActiveRecord::Base
  belongs_to :seller
  belongs_to :store
  belongs_to :warehouse
  has_many :travel_standards
  has_many :travel_premia
  after_initialize :init

  def init
    self.delivery_status ||= "processing" #will set the default value only if it's null
  end
end
