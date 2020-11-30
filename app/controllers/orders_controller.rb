class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
   @order = Order.new
   @address = Address.new
   adress = current_customer.address
  end

  def create
  end

  def thanks
  end

  def confirm
  end

def orders_params
    params.require(:orders).permit(:customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end