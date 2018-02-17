require 'uri'

module Api
  module V1
    class StatesController < ApiController

      def index
        states = State.order(:name)
        render json: states, status: 200
      end

    end
  end
end
