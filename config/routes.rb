Rails.application.routes.draw do
  resources :bloggers
  resources :destinations
  patch '/posts/:id/add_like', to: 'posts#add_like', as: 'add_like'
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
