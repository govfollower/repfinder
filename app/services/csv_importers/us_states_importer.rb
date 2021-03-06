require 'csv'

module CsvImporters
  class UsStatesImporter

    def initialize
      @file_path = Rails.root + "app/assets/csv/us-states.csv"
    end

    def perform
      return false unless @file_path
      states_array = CSV.read(@file_path, headers: true, header_converters: :symbol)
      states_hash = states_array.map {|row| row.to_hash }

      states_hash.each do |state|
        st = State.new(name: state[:name], abbr: state[:abbreviation])
        st.save!      
      end

      true
    end

  end
end
