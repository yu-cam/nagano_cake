class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def show
  	@item = Item.find(params[:id])
  	@cart_item = CartItem.new
  	@cart_item.customer_id = current_customer.id
  	@cart_item.item_id = @item.id
  end

private
  def item_params
  	params.require(:item).permit(:name, :introduction, :price, :genre_id, :image, :is_active)
  end
end
