Rails.application.routes.draw do
  get 'hit_fox_feed/events', to: 'hit_fox_feed#events'
end
