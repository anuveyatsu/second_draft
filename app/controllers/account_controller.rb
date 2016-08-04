require "prawn"
require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/prawn_outputter'
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
    @order.delivery_status = "processing"
    respond_to do |format|
      
     if @order.save 
        format.html { redirect_to account_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to account_path, alert: 'Error' }
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
    @pin = params[:pin]
    if @@order.pincode.to_s == @pin.to_s
      if @@order.delivery_status == "preparing_to_ship"
        @@order.delivery_status = "in_transit"
        @@order.save
        redirect_to account_pickupstore_path, notice: 'The parcel was passed to courier.'
      elsif @@order.delivery_status == "ready_for_collection"
        @@order.delivery_status = "completed"
        @@order.save
        redirect_to account_pickupstore_path, notice: 'The parcel was passed to customer.'
      end
    else
      redirect_to account_pickupstore_path, alert: 'You have entered wrong PIN.'
    end
  end

  def download_pdf
    @label = Order.find(params[:order])
    send_data generate_pdf(@label),
              filename: "order_#{@label.id}.pdf",
              type: "application/pdf"
  end

  private
  def generate_pdf(label)
    seller = Seller.find_by(id: label.seller_id)
    pickup_from = Pickup.find_by(id: label.from)
    pickup_to = Pickup.find_by(id: label.pickup_id)
    Prawn::Document.new do

      bounding_box([0, 700], :width => 300, :height => 220) do
        barcode = Barby::Code39.new "#{label.id}"
        barcode.annotate_pdf(self, :x => 5, :y => 145)
        font_size(25) do
          text_box "NextD", :at => [210, 180]
        end
        font_size(16) do
          text_box "From:", :at => [5, 140]
          text_box "To:", :at => [5, 100]
          text_box "Drop-off:", :at => [5, 40]
          text_box "Pick-up:", :at => [155, 40]
        end
        text_box "#{seller.seller_name}", :at => [55, 137]
        text_box "#{seller.seller_address1}", :at => [55,125]
        text_box "#{seller.seller_phone}", :at => [55, 113]
        text_box "#{label.buyer_name}", :at => [55, 97]
        text_box "Phone: #{label.buyer_phone}", :at => [55, 85]
        text_box "Email: #{label.buyer_email}", :at => [55, 73]
        text_box "#{pickup_from.company}", :at => [73, 37]
        text_box "#{pickup_to.company}", :at => [220, 37]
        transparent(1) { stroke_bounds }
      end
    end.render

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_seller.orders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:from, :pickup_id, :buyer_name, :buyer_phone, :buyer_email, :delivery_option, :transport_provider, :parcel_size_L, :parcel_size_W, :parcel_size_H, :parcel_weight, :parcel_content)
    end
end
