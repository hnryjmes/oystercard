require 'oystercard'

describe Oystercard do
  describe "#balance" do
    it "should report intial balance as 0" do
      expect(subject.balance).to eq 0
    end
  end
end