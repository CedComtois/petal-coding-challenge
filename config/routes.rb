Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/pokemons", to: "pokemons#index"
  get "/pokemon/:id", to: "pokemons#show"
  post "/pokemon", to: "pokemons#create"
  patch "/pokemon/:id", to: "pokemons#patch"
  delete "/pokemon/:id", to: "pokemons#delete"
end
