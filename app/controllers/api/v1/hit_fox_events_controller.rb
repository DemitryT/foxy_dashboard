module Api
  module V1
    class HitFoxEventsController < ApplicationController
      before_action ApiKeyAuthentication

      respond_to :json

      def index
        @events = HitFoxActivity.new.events
        render json: @events, status: :ok
      end
    end
  end
end
