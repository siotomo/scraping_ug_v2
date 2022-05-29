Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :girls

      get 'rankers', to: 'girls#rankers'
    end
  end
end