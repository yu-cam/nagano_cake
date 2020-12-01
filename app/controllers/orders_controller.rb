class OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
   @order = Order.new
   @customer = current_customer
  end

  def create
   @address = Address.new(address_params)
   @address.customer_id = current_customer.id
   @address.save!
   render action: :confirm
  end

  def thanks
  end

  def confirm
  end

def orders_params
    params.require(:orders).permit(:customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end