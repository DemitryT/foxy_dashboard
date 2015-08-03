module Api
  module V1
    class HitFoxFeedsController < ApplicationController
      respond_to :json

      def events
        @events = HitFoxFeed.new.events
        render json: @events, status: :ok
      end
    end
  end
end
