Rails.application.routes.draw do

  devise_for :users
  root 'welcome#index'
  get 'welcome/index'

  authenticated :user do
    root 'docs#index', as: 'authenticated_root'
  end
  # 失敗！！沒效果

  resources :docs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
