class OrdersController < ApplicationController
  # before_action :require_login
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      render json: @order.create_razorpay_order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def verify_payment
    order = Order.find_by(razorpay_order_id: params[:razorpay_order_id])
    status = order.verify_razorpay_order(params[:razorpay_order_id], params[:razorpay_payment_id], params[:razorpay_signature])
    send_confirmation_information(order) if status == 200
    render json: { msg: 'Processed' }, status: status
  end

  def send_confirmation_information(order)
    data = order.conference_data
    data['confirmation_token'] = order.id
    SendgridMailerWorker.perform_async(order.email_id, :PAYMENT_CONFIRMATION, data)
    SmsServiceWorker.perform_async(order.mobile_number, "Payment confirmed from TicketMedium. Thanks #{order.full_name}. Your confirmation id #{order.confirmation_token} for #{order.conference.title} at #{order.conference.start_date.strftime("%d, %b %Y %I:%M%P")} IST")
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    if @order.update(order_params)
      render :show, status: :ok, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    render head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:conference_id, :quantity, :promocode, :ticket_price_id, :email_id, :mobile_number, :full_name)
    end
end
