require 'uri'

module Api
  module V1
    class DistrictsController < ApiController

      #TODO : Strong params

      def index
        districts = District.order(state_id: :asc, number: :asc)
        render json: districts, status: 200
      end

      def reps
        district = District.find(params[:district_id])
        reps = RepFinders::ByDistrict.new(district).perform
        render json: reps, status: 200
      end

      def address
        addr = encode_address if address_valid?
        district = CensusGeocoders::AddressDistrictFinder.new(addr).perform
        if district.present?
          render json: district, status: 200
        else
          head 422
        end
      end

      private

      def address_valid?
         params[:street].present? && params[:city].present? && params[:state].present?
      end

      def encode_address
        {
          street: URI.encode(params[:street]),
          city: URI.encode(params[:city]),
          state: URI.encode(params[:state])
        }
      end

    end
  end
end
