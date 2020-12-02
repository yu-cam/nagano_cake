class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def updadate
  end

  def hide
  end

  def withdraw
  end

private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end
end
