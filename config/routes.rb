Musicapp::Application.routes.draw do
  resources :users
  resource :session

  resources :bands do
    resources :albums, only: [:index, :new, :create]
  end
  resources :albums, except: [:index, :new, :create] do
    resources :songs, only: [:index]
  end
  resources :songs, except: [:index]
end
