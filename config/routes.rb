Rails.application.routes.draw do
  root 'home_page#index'
  resources :vacancies, only: [:index, :show]
end
