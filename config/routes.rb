Rails.application.routes.draw do
    
    get 'posts/show' => 'posts#show'
    get 'posts/new' => 'posts#new'
    post 'posts/create' => 'posts#create'
    get 'posts/destroy/:post_id' => 'posts#destroy'
    get 'posts/show_edit/:post_id' => 'posts#show_edit'
    post 'posts/update/:post_id' => 'posts#update'
    
    resources :users, only: [:new, :create, :validate, :update, :show]
    resources :sessions, only: [:new, :create, :destroy]
    
    get '/' => 'home#index'
    get 'search/search'
    get 'users/show' => 'users#show'
    
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
