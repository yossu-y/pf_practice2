Rails.application.routes.draw do
  
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
  end
  namespace :public do
    get 'articles/index'
    get 'articles/edit'
    get 'articles/show'
    get 'articles/new'
  end
  # 利用者用
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  
  
  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
