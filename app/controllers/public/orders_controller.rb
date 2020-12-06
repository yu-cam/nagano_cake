class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer_orders
  end

  def show
    @orders = current_customer_orders
    @order = Order.find(params[:id])
  end

  def new
   @order = Order.new
   @customer = current_customer
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save!
   redirect_to public_orders_thanks_path
  end

  def thanks
  end

  def confirm
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum {|cart_item| cart_item.amount * cart_item.item.price }
    @order = Order.new(order_params)
    # if params[:order][:payment_method] == "0"
    #    @order.address
    if  params[:order][:address_option] == "0"
        @order.address = current_customer.address
        @order.postal_code = current_customer.postal_code
        @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
          @address = Address.find(params[:order][:address_id])
          @order.address = @address.address
          @order.postal_code = @address.postal_code
          @order.name = @address.name
    elsif params[:order][:address_option] == "2"
          @order.postal_code
          @order.address
          @order.name
    end
  end

def order_params
    params.require(:order).permit(:customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end