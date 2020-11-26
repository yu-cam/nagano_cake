Rails.application.routes.draw do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :items, only: [:show, :index]
  namespace :admin do
    resources :items, except: [:destroy]
  end
  namespace :admin do
    resources :genres, except: [:show, :destroy]
  end
  namespace :admin do
    resources :end_users, except: [:new, :create, :destroy]
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

  devise_for :admin, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

end
