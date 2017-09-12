Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'page#home'

  resources :people do
    resources :educations
    resources :skills
    resources :objectives
    resources :character_references
  end
  
end
