Rails.application.routes.draw do
  resources :transactions
  resources :accounts
end

# fetch('http://localhost:3000/transactions')
