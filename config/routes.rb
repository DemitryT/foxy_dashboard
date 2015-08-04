Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # get '/hit_fox_feeds/events' => 'api/v1/hit_fox_feeds#events'

  namespace :api do
    namespace :v1 do
      resources :hit_fox_events, only: [:index]
    end
  end
end
