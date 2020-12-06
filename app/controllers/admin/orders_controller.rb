class Admin::OrdersController < ApplicationController
  def index
    @orders = Oder.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.items
  end

  def update
  end

  private
    def order_params
      params.require(:order).permit(:customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end
end
