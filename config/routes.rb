Rails.application.routes.draw do

  get 'save_product', to: 'products#save_product'
  post 'save_product', to: 'products#save_product'
  get 'add_row', to: 'products#add_row'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
