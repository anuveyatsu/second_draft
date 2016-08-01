class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json

    def index
      @orders = current_seller.orders.all
    end

    # GET /orders/1
    # GET /orders/1.json
    def show
    end

    # GET /orders/new
    def new
      @order = current_seller.orders.new
    end

    # GET /orders/1/edit
    def edit
    end

    # POST /orders
    # POST /orders.json
    def create
      @order = current_seller.orders.new(order_params)
      @order.seller_id = current_seller.id
      @order.pincode = rand(10000..99999)
      respond_to do |format|
      if @order.save
          format.html { redirect_to account_path, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { redirect_to account_path, alert: 'Error'}
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /orders/1
    # PATCH/PUT /orders/1.json
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

    # DELETE /orders/1
    # DELETE /orders/1.json
    def destroy
      @order.destroy
      respond_to do |format|
        format.html { redirect_to account_path, notice: 'Order was successfully destroyed.' }
        format.json { head :no_content }
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
