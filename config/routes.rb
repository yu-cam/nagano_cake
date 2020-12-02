Rails.application.routes.draw do
  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
 namespace :public,path: ""do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  post '/orders/confirm' => 'orders#confirm'
  get '/orders/thanks' => 'orders#thanks'
  get '/customers/hide' => 'customers#hide'
  get '/customers/withdraw' => 'customers#withdraw'
  resources :cart_items do
    collection do
      delete 'destroy_all'
    end
  end
  resources :customers, only: [:show, :edit, :update]
  resources :addresses, except: [:show, :new]
  resources :orders, only: [:index, :show, :new, :create]
  resources :cart_items, only: [:index, :update, :create, :destroy]
  resources :items, only: [:show, :index]
 end
  namespace :admin do
    resources :end_users, except: [:new, :create, :destroy]
    resources :genres, except: [:show, :destroy]
    resources :items, except: [:destroy]
  end


  # devise_for :admins
  # devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #  devise_for :admins, :controllers => {
  #   :registrations => 'admins/registrations',
  #   :sessions => 'admins/sessions'
  # }

  # devise_scope :admin do
  #   get "sign_in", :to => "admins/sessions#new"
  #   get "sign_out", :to => "admins/sessions#destroy"
  # end

end
