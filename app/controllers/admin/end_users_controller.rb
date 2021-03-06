class Admin::EndUsersController < ApplicationController
  def index
  	@customer = Customer.with_deleted
  end

  def show
  	@customer = Customer.with_deleted.find(params[:id])
  end

  def edit
    @customer = Customer.with_deleted.find(params[:id])
  end

  def update
    @customer = Customer.with_deleted.find(params[:id])
    @customer.update(customer_params)

    if params[:customer][:deleted_at] == "0"
      @customer.restore
    elsif params[:customer][:deleted_at] == "1"
      @customer.destroy
    end

    redirect_to admin_end_user_path(@customer.id)
  end

  #   if @customer.save
  #    redirect_to admin_end_user_path(customer.id)
  #   else
  #    render :edit
  #   end
  # end

private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
