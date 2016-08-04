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
    #@pickupstore = Pickup.find(current_pickup.id)
    #@pickupstore = Pickup.find(current_pickup.id)
    #company = params[:pickupstore][:company]
    #@pickupstore.company = company
    #@pickupstore.save
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
      #stroke_axis
      bounding_box([0, 700], :width => 540, :height => 220) do
        self.line_width = 5
        self.stroke_color = "D2D6DF"
        transparent(1) { stroke_bounds }

        stroke do
          vertical_line 0, 220, :at => 75
          vertical_line 0, 220, :at => 430
          horizontal_line 75, 430, :at => 160
          vertical_line 90, 160, :at => 252
          horizontal_line 75, 540, :at => 90
          horizontal_line 75, 430, :at => 45
        end

        barcode = Barby::Code39.new "00000000000#{label.id}"
        rotate(270, :origin => [20, 200]) do
          barcode.annotate_pdf(self, :x => 15, :y => 195)
          text_box "00000000000#{label.id}", :at => [65, 195]
        end

        text_box "NextD", :at => [450, 200], :size => 25
        text_box "LOGO", :at => [320,195], :size => 18

        font_size(6) do
          text_box "Seller info", :at => [80,215]
          text_box "Drop-off:", :at => [80, 150]
          text_box "Pick-up:", :at => [257, 150]
          text_box "Customer:", :at => [80,85]
          text_box "Order details:", :at => [80,40]
          text_box "Delivery option:", :at => [435,85]
          text_box "Transport provider:", :at => [435,40]
        end

        font_size(10) do
          text_box "#{seller.seller_name}", :at => [125, 205]
          text_box "#{seller.seller_address1}", :at => [125,190]
          text_box "#{seller.seller_phone}", :at => [125, 175]

          text_box "#{label.buyer_name}", :at => [125, 85]
          text_box "Phone: #{label.buyer_phone}", :at => [125, 73]
          text_box "Email: #{label.buyer_email}", :at => [125, 61]

          text_box "Parcel size: up to L50 cm x W50 cm x H50 cm", :at => [125,30]
          text_box "Parcel weight: #{label.parcel_weight}", :at => [125,15]
          text_box "Parcel content: #{label.parcel_content}", :at => [257,15]

          text_box "#{label.delivery_option}", :at => [445,70]
          text_box "#{label.transport_provider}", :at => [445,25]
        end


        text_box "#{pickup_from.company}", :at => [130, 135], :width => 120
        text_box "address", :at => [130, 120], :size => 10, :width => 120
        text_box "#{pickup_to.company}", :at => [307, 135], :width => 120
        text_box "address", :at => [307, 120], :size => 10, :width => 120

      end

      #dash(1, :space => 1, :phase => 0)
      #stroke_color "818181"
      #stroke_horizontal_line -80, 600, :at => 440

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
