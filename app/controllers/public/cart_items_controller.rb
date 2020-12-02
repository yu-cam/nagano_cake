class Public::CartItemsController < ApplicationController
  def index
  	@cart_items = current_customer.cart_items
    @total_price = @cart_items.sum {|cart_item| cart_item.amount * cart_item.item.price }
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	@cart_item.customer_id = current_customer.id
  	@cart_item.save
  	redirect_to public_cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    cart_item.save
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  def cart_item_params
  	params.require(:cart_item).permit(:amount, :item_id)
  end
end