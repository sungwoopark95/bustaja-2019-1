Rails.application.routes.draw do
    
    resources :users, only: [:new, :create, :validate, :update, :show]
    resources :sessions, only: [:new, :create, :destroy]
    resources :posts, except: [:show]
    
    get '/' => 'home#index'
    get 'search/search'
    get 'users/show' => 'users#show'
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
