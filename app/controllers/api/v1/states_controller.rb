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

      def image
        state = State.find(params[:state_id])
        state_name = state.name.downcase
        state_name = state_name.gsub(' ', '-')
        # not ideal but it works - might want to think through fingerprinting
        send_file("#{Rails.root}/app/assets/images/states/#{state_name}.svg")
      end
    end
  end
end
