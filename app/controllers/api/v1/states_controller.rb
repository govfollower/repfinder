require 'uri'

module Api
  module V1
    class StatesController < ApiController

      def index
        states = State.order(:name)
        render json: states, status: 200
      end


      def districts
        districts = District.where(state_id: params[:state_id]).order(:number)
        render json: districts, status: 200
      end 
    end
  end
end
