Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/pokemons", to: "pokemons#index"
  get "/pokemons/:id", to: "pokemons#show"
  post "/pokemons", to: "pokemons#create"
  patch "/pokemons/:id", to: "pokemons#patch"
  delete "/pokemons/:id", to: "pokemons#delete"
end
