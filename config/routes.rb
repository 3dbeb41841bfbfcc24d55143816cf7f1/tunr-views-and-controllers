Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artists do
    resources :songs
  end

  get '/songs', to: 'songs#all_songs'

  root 'artists#index'
end
