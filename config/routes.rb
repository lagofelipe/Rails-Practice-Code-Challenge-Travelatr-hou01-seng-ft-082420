Rails.application.routes.draw do
  resources :bloggers, only: [:index, :new, :show, :create]
  end
  resources :destinations
end
