Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'ai/train' => 'ai#train'
  get 'ai/predict' => 'ai#predict'

  # Defines the root path route ("/")
  # root "articles#index"
end
