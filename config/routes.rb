Rails.application.routes.draw do
  resources :retro_boards do
    resources :retro_items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "retro_boards#index"

end
