class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
	# deviseコントローラーにストロングパラメータを追加する

    def after_sign_in_path_for(resource)
      if resource.class.name == 'Customer'
      public_items_path
      else
      admin_items_path
    end
    end

	protected

    def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
   # サインアップ時にnameのストロングパラメータを追加

  end
end
