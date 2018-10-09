require 'journey'

describe Journey do
  let (:station) { double :station }
  let (:station_2) { double :station }
  let(:journey){ {from: station, to: station_2} }

  it 'can store entry station' do
    expect(subject.entry_station[:name]).to eq 'Waterloo'
  end
end
