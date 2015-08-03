module Api
  module V1
    class HitFoxFeedsController < ApplicationController
      respond_to :json

      swagger_controller :hit_fox_feeds, 'HitFoxFeeds'

      swagger_api :events do
        summary 'Returns all Push Events and Pull Request of the HitFox Github'
      end

      def events
        render json: HitFoxFeed.new.events, status: :ok
      end
    end
  end
end
