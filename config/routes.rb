Rails.application.routes.draw do

  namespace :admin do
    get 'customers/show'
    get 'customers/index'
    get 'customers/edit'
  end
  namespace :public do
    get 'reviews/new'
    get 'reviews/show'
    get 'reviews/index'
    get 'reviews/edit'
  end
  namespace :public do
    get 'games/show'
    get 'games/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/quit'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get  "/" => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]

  end

  scope module: :public do
    resources :customers, only: [:show, :update, :edit]
    root to: "homes#top"
    get "/about" => 'homes#about', as: 'about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
