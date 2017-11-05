Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index', to: 'recipes#index', as: 'root'

  get 'recipes/search', to: 'recipes#search', as: 'search'
  # get 'recipes/show/:uri', to: 'recipes', as: 'recipe'
  # resources :recipes, except: [:show]

  resources :recipes

end

# http://localhost:3000/recipes/search
# ?utf8=%E2%9C%93&search_term=eggs&commit=SEARCH
