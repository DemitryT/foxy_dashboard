Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'hit_fox_feed/events', to: 'hit_fox_feed#events'
end
