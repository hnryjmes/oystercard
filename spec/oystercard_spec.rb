require 'oystercard'

describe Oystercard do
  let (:minimum) { Oystercard::MIN_FARE }
  let (:penalty) { Oystercard::PENALTY_FARE }

  let (:entry_station) { double :station }
  let (:exit_station) { double :station }
  let (:journey) { double(:journey, fare: minimum, entry_station: "aldgate") }
  let (:log) { double(:log, start: true, finish: true, current_journey: journey, clear_journey: true)}

  before { allow(subject).to receive(:log).and_return(log) }

  describe "#balance" do
    it "should report intial balance as 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "should increase the balance by 10" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it "should raise an error if balance exceeds LIMIT" do
      subject.top_up(Oystercard::LIMIT)
      expect { subject.top_up(1) }.to raise_error "Card limit of #{Oystercard::LIMIT} exceeded"
    end
  end

  describe "#touch_in" do
    it "should call start on log" do
      expect(log).to receive(:start)
      subject.top_up(minimum)
      subject.touch_in(entry_station)
    end

    it "should not be able to touch in if balance is below the minimum fare" do
      expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance"
    end
  end

  describe "#touch_out" do
    before { subject.top_up(minimum) }

    it "should call finish on log" do
      expect(log).to receive(:finish)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end

    it "should call clear_journey on log" do
      expect(log).to receive(:clear_journey)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end

    it "should deduct money on touch out" do
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-minimum)
    end

    it "should charge the penalty fare if no entry station" do
      allow(journey).to receive(:fare).and_return(penalty)
      expect { subject.touch_out(entry_station) }.to change{ subject.balance }.by(-penalty)
    end
  end
end
