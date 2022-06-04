Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
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
    root to: 'users/sessions#new'
    get 'signup', :to => 'users/registrations#new'
    get 'login', :to => 'users/sessions#new'
    delete 'logout', :to => 'users/sessions#destroy'
  end

   get "dashboard", :to => "dashboard#index"
end
