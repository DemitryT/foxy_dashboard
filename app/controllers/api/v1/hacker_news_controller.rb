module Api
  module V1
    class HackerNewsController < ApplicationController
      before_action :authenticate_user!

      respond_to :json

      def index
        @stories = HackerNews.new.stories
        render json: @stories, status: :ok
      end
    end
  end
end
