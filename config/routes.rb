Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  get 'events', to: 'hit_fox_feed#events'
end
