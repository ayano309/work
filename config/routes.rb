Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'user/products#index'
  # user関連
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  # userのサインアップなど
  devise_scope :user do
    get 'signup', :to => 'users/registrations#new'
    get 'login', :to => 'users/sessions#new'
    delete 'logout', :to => 'users/sessions#destroy'
  end

  devise_for :admins, :controllers => {
     :sessions => 'admins/sessions'
   }

   devise_scope :admin do
     get "dashboard", :to => "dashboard#index"
     get "dashboard/login", :to => "admins/sessions#new"
     post "dashboard/login", :to => "admins/sessions#create"
     delete "dashboard/logout", :to => "admins/sessions#destroy"
   end

namespace :dashboard do
 resources :categories, except: [:show,:new]
 resources :products, except: [:show]
 resources :orders, only: [:index,:show :update]
end

namespace :user do
  resources :products, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete '/cart_items', :to => 'cart_items#all_destroy',as: 'cart_items_all_delete'
  resources :addresses,except: [:show,:new]
  resources :orders, except: [:edit, :update,:destroy]
  post 'orders/confirm',:to => 'orders#confirm'
  get '/thanks', :to => 'orders#thanks'
end


end
