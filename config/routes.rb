Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get '/api' => redirect('/swagger/dist/index.html?url=/hit_fox_feeds/events.json')
  get '/hit_fox_feeds/events' => 'api/v1/hit_fox_feeds#events'
end
