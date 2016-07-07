class AccountController < OrdersController
  before_action :authenticate_seller!, only: [:seller]
  before_action :authenticate_pickup!, only: [:pickupstore]
  def index
    if seller_signed_in?
      redirect_to account_seller_path
    elsif pickup_signed_in?
      redirect_to account_pickupstore_path
    end
  end
  def new
    if seller_signed_in?
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
