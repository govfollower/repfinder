require 'csv'

module CsvImporters
  class DistrictsImporter

    def initialize
      @file_path = Rails.root + "app/assets/csv/us-states.csv"
    end

    def perform
      return false unless @file_path
      states_array = CSV.read(@file_path, headers: true, header_converters: :symbol)
      states_hash = states_array.map {|row| row.to_hash }

      states_hash.each do |state|
        i = 1
        num = state[:districts].to_i
        while i <= num  do
          stateRecord = State.find_by(abbr: state[:abbreviation])
          stateRecord.districts.create!(number: i)
           i +=1
        end
      end

      true
    end

  end
end
