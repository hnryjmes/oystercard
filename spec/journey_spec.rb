require 'journey'

describe Journey do

  let (:entry_station) { double :station }
  let (:exit_station) { double :station }
  subject {described_class.new(entry_station: entry_station, exit_station: exit_station)}


  it 'can store entry station' do
    expect(subject.from).to eq entry_station
  end

  it 'can store exit station' do
    expect(subject.to).to eq exit_station
  end

end
