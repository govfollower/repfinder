
module RepUpdaters
  class AllRepsUpdater

    def initialize
    end

    def perform
      update_house_reps
      update_senate_reps
      return true
    end

    private

    def update_house_reps
      house_reps = PropublicaApi::GetAllHouseReps.new(false).perform
      house_reps.each do |rep|
        RepUpdaters::HouseRepUpdater.new(rep).perform
      end
    end

    def update_senate_reps
      senate_reps = PropublicaApi::GetAllSenateReps.new(false).perform
      senate_reps.each do |rep|
        RepUpdaters::SenateRepUpdater.new(rep).perform
      end
    end

  end
end
