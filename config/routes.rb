Rails.application.routes.draw do
  root to:'public/posts#index'
  get 'admin/posts' => 'admin/posts#index'
  # 利用者用
  # URL /customers/sign_in 
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  # 管理者用
  # URL /admin/sign_in
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # 管理者用
  namespace :admin do
    resources :users, only: [:index, :show,:edit,:update]
  end
  # 利用者用
  scope module: :public do
    get '/users/my_page' => 'users#show'
    get '/users/information/edit' => 'users#edit'
    patch '/users/information' => 'users#update'
    get 'users/quit' => 'users#quit'# 退会確認画面
    patch  '/users/withdraw' => 'users#withdraw'# 論理削除用のルーティング
    resources :posts, only: [:new, :create, :index, :show, :edit, :destroy]
    patch 'posts/:id' => 'posts#update', as: 'update_post'
  end
end
