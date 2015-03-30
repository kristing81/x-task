Rails.application.routes.draw do

  root to: 'welcome#index'

  resources :mutants
  resources :tasks
  resources :teams
end
