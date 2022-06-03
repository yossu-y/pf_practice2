Rails.application.routes.draw do
  
  # 利用者用
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    
    root to: "homes#top"
    get "about" => "homes#about", as: "about"
    
    resources :articles do
      resources :comments, only:[:create, :destroy]
    end
    
    get "users/my_page/:id" => "users#show", as: "my_page"
    get "users/unsubscribe/:id" => "users#unsubscribe", as: "unsubscribe"
    resources :users, only: [:edit, :update, :show]
    
    
    
  end
  
  

  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
