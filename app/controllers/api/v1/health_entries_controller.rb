module Api
  module V1
    class HealthEntriesController < ApplicationController
      before_action :authenticate_user!

      def index
        @health_entries = current_user.health_entries.order(date: :desc)
        render json: @health_entries
      end
    end
  end
end
