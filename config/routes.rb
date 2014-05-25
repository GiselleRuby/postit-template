
PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  # root to: 'categories#index'

  resources :posts, except: [:destroy]
  resources :categories, only: [:new, :create, :show]

end
