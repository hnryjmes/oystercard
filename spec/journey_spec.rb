require 'journey'

describe Journey do

  let (:station) { double :station }
  let (:station_2) { double :station }
  subject {described_class.new(station, station_2)}


  it 'can store entry station' do
    expect(subject.from).to eq station
  end

  it 'can store exit station' do
    expect(subject.to).to eq station_2
  end

end
