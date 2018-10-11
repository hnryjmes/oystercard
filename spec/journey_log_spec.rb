require 'journey_log'

describe JourneyLog do
  let(:journey_log) { described_class.new }
  let(:journey) { double(:journey, start: true, finish: true, data: {test: "test"}) }
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }
  before { allow(journey_log).to receive(:current_journey).and_return(journey) }

  describe '#start' do
    it 'calls #start on current journey' do
      expect(journey).to receive(:start).with(entry_station)
      journey_log.start(entry_station)
    end
  end

  describe '#finish' do
    it 'calls #finish on current journey' do
      expect(journey).to receive(:finish).with(exit_station)
      journey_log.finish(exit_station)
    end

    it 'stores data from current journey in journeys' do
      journey_log.finish(exit_station)
      expect(journey_log.journeys).to include({test: "test"})
    end

  end

  describe '#clear_journey' do
    it 'clears current journey after data has been recorded' do
      journey_log = described_class.new
      old_journey = journey_log.current_journey
      journey_log.clear_journey
      expect(journey_log.current_journey).not_to eq old_journey
    end
  end

end
