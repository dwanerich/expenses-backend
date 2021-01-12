Rails.application.routes.draw do
  
  # nested routing below this prevents routes of transactions not associated with an account
  
  resources :accounts do
    resources :transactions
  end
end

# fetch('http://localhost:3000/transactions')
