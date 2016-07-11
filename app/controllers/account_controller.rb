class AccountController < OrdersController
  before_action :authenticate_seller!, only: [:seller]
  before_action :authenticate_pickup!, only: [:pickupstore]
  before_action :set_order, only: [:show, :edit, :update, :destroy]

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
  def add
    @order = current_seller.orders.new
  end
  def create
    @order = current_seller.orders.new(order_params)
    @order.seller_id = current_seller.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to account_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to account_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def seller
    @orders = current_seller.orders.all
  end
  def history
    @orders = current_seller.orders.all
  end

  def pickupstore
  end

  def receive
    @@order = Order.find(params[:order])
    if @@order.delivery_status == "processing"
      @@order.delivery_status = "preparing_to_ship"
      @@order.save
      redirect_to account_pickupstore_path
    elsif @@order.delivery_status == "in_transit"
      @@order.delivery_status = "ready_for_collection"
      @@order.save
      redirect_to account_pickupstore_path
    end
  end

  def release
    @@order = Order.find(params[:order])
    if @@order.pincode == params[:pin]
      if @@order.delivery_status == "preparing_to_ship"
        @@order.delivery_status = "in_transit"
        @@order.save
        redirect_to account_pickupstore_path
      elsif @@order.delivery_status == "ready_for_collection"
        @@order.delivery_status = "completed"
        @@order.save
        redirect_to account_pickupstore_path
      end
    else
      redirect_to account_pickupstore_path, alert: 'Pincode is wrong!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_seller.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:from, :store_id, :buyer_name, :buyer_phone, :buyer_email, :delivery_option, :transport_provider, :parcel_size_L, :parcel_size_W, :parcel_size_H, :parcel_weight, :parcel_content)
    end
end
