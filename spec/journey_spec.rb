require 'journey'

describe Journey do

  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }
  let(:journey) { described_class.new }
  let(:minimum) { described_class::MIN_FARE }
  let(:penalty) { described_class::PENALTY_FARE }


  describe "#fare" do
    it "returns the minimum fare if journey complete" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq minimum
    end

    it 'returns penalty fare if no entry_station' do
      journey.finish(exit_station)
      expect(journey.fare).to eq penalty
    end
  end

  describe '#start' do
    it 'starts a journey' do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

  describe '#data' do
    it 'creates incomplete hash with only entry station' do
      journey.start(entry_station)
      expect(journey.data).to eq({ entry: entry_station, exit: nil })
    end

    it 'creates incomplete hash with only exit station' do
      journey.finish(exit_station)
      expect(journey.data).to eq({ entry: nil, exit: exit_station })
    end

    it 'creates complete hash with both stations' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.data).to eq({ entry: entry_station, exit: exit_station })
    end
  end

  describe '#complete?' do
    it 'reports journey as incomplete initially' do
      expect(journey).not_to be_complete
    end

    it 'reports journey as incomplete with only one station' do
      journey.start(entry_station)
      expect(journey).not_to be_complete
    end


    it 'reports journey as complete when it is complete' do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey).to be_complete
    end


  end


end
