Rails.application.routes.draw do
  resources :categories
  root 'categories#index'
  namespace 'api' do
    namespace 'v1' do
      resources :categories
    end
  end
end
