class Admin::OrdersController < ApplicationController
  def index
      @orders = Order.all
    # Order.all.each do |order|
    #   user_id = order.customer_id
    #   user = Customer.find(user_id)
    #   if user.deleted_at == nil
    #     @orders.push(order)
    #   end
    # end
  end

  def show
    @order = Order.find(params[:id])
    @price = @order.order_details.sum {|order_detail| order_detail.amount * order_detail.price }
  end

  def update
    @order = Order.find(params[:id])
    # @order.update(order_params)
    @order.update(status: params[:order][:status].to_i)
    @order_details = @order.order_details
    if @order.status_before_type_cast == 1
       @order_details.each do |order_detail|
       order_detail.update(maiking_status: 1)
       end
    end
    redirect_to admin_order_path(@order)
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end
end
