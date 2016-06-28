class AccountController < ApplicationController
  before_action :authenticate_user!, only: [:seller]
  before_action :authenticate_pickup!, only: [:pickupstore]
  def index
  end
  def new
  end
  def seller
  end
  def pickupstore
  end
end
