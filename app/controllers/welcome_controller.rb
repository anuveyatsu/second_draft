class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to account_seller_path
    elsif pickup_signed_in?
      redirect_to account_pickupstore_path
    end
  end
end
