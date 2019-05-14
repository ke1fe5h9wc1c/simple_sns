Rails.application.routes.draw do

  root to: 'users#index'
  # deviseの処理
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # User登録の処理
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
  # 中間テーブルの処理
  Rails.application.routes.draw do
    resources :relationships, only: [:create, :destroy]
  end
  
  resources :users
  resources :tweets, only: [:create, :new]
end
