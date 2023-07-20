Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get  "/" => "reviews#index"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update]

  end

  scope module: :public do
    get 'games/search', to: "games#search"
    get "/customers/quit" => "customers#quit"
    patch "/customers/out" => "customers#out"
    resources :customers, only: [:show, :update, :edit]
    resources :games, only: [:show, :index]
    resources :reviews, only: [:new, :show, :edit, :index, :create, :update]
    root to: "homes#top"
    get "/about" => 'homes#about', as: 'about'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
