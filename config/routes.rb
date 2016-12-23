Rails.application.routes.draw do
    
  # resources :crunches
  get '/crunch_data' => "crunches#crunch", as: :crunch_data
  get '/api' => redirect('/swagger/dist/index.html?url=/apidocs/api-docs.json')
  root 'crunches#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
