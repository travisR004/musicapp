Musicapp::Application.routes.draw do
  root to: 'bands#index'

  resources :users do
    get 'activate', on: :collection
  end

  resource :session

  resources :bands do
    resources :albums, only: [:index, :new, :create]
  end

  resources :albums, except: [:index, :new, :create] do
    resources :songs, only: [:index, :new, :create]
  end

  resources :songs, except: [:index, :new, :create] do
    resources :notes, only: [:create]
  end
end
