class AccountController < ApplicationController
  before_action :authenticate_user!, only: [:seller]
  before_action :authenticate_pickup!, only: [:pickupstore]
  def index
    if user_signed_in?
      redirect_to account_seller_path
    elsif pickup_signed_in?
      redirect_to account_pickupstore_path
    end
  end
  def new
    if user_signed_in?
      redirect_to account_seller_path
    elsif pickup_signed_in?
      redirect_to account_pickupstore_path
    end
  end
  def seller
  end
  def pickupstore
  end
end
