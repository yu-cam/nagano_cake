class Public::CustomersController < ApplicationController
  # before_action :authenticate_customer!
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
     @customer.update(customer_params)
    if @customer.save
     redirect_to public_customers_mypage_path
    else
     render :edit
    end
  end

  def hide
  end

  def withdraw
    @customer = Customer.find(params[:id])
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.destroy
    #ログアウトさせる
    # reset_session
    # redirect_to root_path
    redirect_to public_root_path
  end


private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
end
