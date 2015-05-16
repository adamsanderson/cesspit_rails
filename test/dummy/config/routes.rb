Rails.application.routes.draw do
  get 'demo/:id' => 'demo#show'
end
