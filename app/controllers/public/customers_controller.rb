class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
     @customer.update(customer_params)
    if customer.save
     redirect_to public_customers_mypage_path
    else
     render :edit
    end
  end

  def hide
  end

  def withdraw
    @customer = current_customer
    #is_deletedカラムにフラグを立てる(defaultはfalse)
    @customer.update(is_active: false)
    #ログアウトさせる
    reset_session
    redirect_to root_path
  end


private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
