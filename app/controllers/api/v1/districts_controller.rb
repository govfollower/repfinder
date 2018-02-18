require 'uri'

module Api
  module V1
    class DistrictsController < ApiController

      def reps
        district = District.find(params[:district_id])
        reps = RepFinders::ByDistrict.new(district).perform
        render json: reps, status: 200
      end

    end
  end
end
