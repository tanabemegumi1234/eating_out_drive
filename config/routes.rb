Rails.application.routes.draw do
  root to:'public/homes#top'
  get 'admin/posts'  => 'admin/posts#index'
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
  namespace :admin do
    get '/users' => 'users#index'
  end
  scope module: :public do
    get '/posts' => 'posts#index'
    get '/users/my_page' => 'users#show'
  end
end
