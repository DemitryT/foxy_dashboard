Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: redirect('/api')

  get '/hit_fox_feeds/events' => 'api/v1/hit_fox_feeds#events'
end
