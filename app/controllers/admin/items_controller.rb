class Admin::ItemsController < ApplicationController
  before_action :if_not_admin

  def index
  	@items = Item.all
  end

  def new
  	@book = Book.find(params[:id])
  end

  def create
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	item = Iist.find(params[:id])
    item.update(item_params)
    redirect_to items_path(item.id)
  end

private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def item_params
  	params.require(:item).permit(:name, :introduction, :price)
  end
end