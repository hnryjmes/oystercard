require 'station'

describe Station do

  subject {described_class.new('Waterloo', 1)}
  it 'can have name' do
    expect(subject.name).to eq 'Waterloo'
  end

  it 'can have a zone number' do
    expect(subject.zone).to eq 1
  end
end
