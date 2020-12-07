class Public::OrdersController < ApplicationController
  def index
    @customer = current_customer
    @orders = @customer.orders
    end

  def show
  end

  def new
   @order = Order.new
   @customer = current_customer
  end

  def create
   @order = Order.new(order_params)
   @order.customer_id = current_customer.id
   @order.save!

   @cart_items = current_customer.cart_items
   @cart_items.each do |cart_item|
     # @order_detail = OrderDetail.new
     # @order_detail.item_id = cart_item.id
     # @order_detail.order_id = @order.id
     # @order_detail.price = cart_item.item.price
     # @order_detail.amount = cart_item.amount
     result = OrderDetail.create(item_id: cart_item.id, order_id: @order.id, price: cart_item.item.price, amount: cart_item.amount)
   end
   CartItem.destroy_all
   redirect_to public_orders_thanks_path
  end

  def thanks
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.total_payment = @cart_items.sum {|cart_item| cart_item.amount * cart_item.item.price }
    @order.shipping_cost = 800
    @order.status = 0
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
    params.require(:order).permit(:customer_id, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :postal_code, :created_at)
  end
# def order_detail_params
#    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount)
# end

end