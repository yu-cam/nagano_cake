class CartItemsController < ApplicationController
  def index
  	@cart_items = current_customer.cart_items
  end

  def create
  	@cart_item = CartItem.new(cart_item_params)
  	@cart_item.customer_id = current_customer.id
  	@cart_item.save
  	redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def cart_item_params
  	params.require(:cart_item).permit(:amount, :item_id)
  end