require './lib/oystercard'

describe Oystercard do
  limit = Oystercard::BALANCE_LIMIT
  min_fare = Oystercard::MIN_FARE
  let(:station) { double :station }

  describe "Touch in" do

    it "#touch_in" do
      subject.top_up 1
      subject.touch_in(:station)
      expect(subject.in_journey?).to eq true
    end

    it "raises exception when trying to touch in with balance below 1" do
      expect{ subject.touch_in(:station) }.to raise_error "Insufficient funds"
    end

    it "records station name on touch in" do
      subject.top_up 1
      subject.touch_in(:station)
      expect(subject.entry_station).to eq :station
    end

  end

  describe "Touch out" do

    it "#touch_out" do
      subject.top_up 1
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.in_journey?).to eq false
    end

    it "deducts fare when touch_out" do
      expect{ subject.touch_out(:station) }.to change{ subject.balance }.by -min_fare
    end

    it "records an exit station name on touch out" do
      subject.top_up 1
      subject.touch_in :station
      subject.touch_out :station
      expect(subject.exit_station).to eq :station
    end
  end

  describe "Top up" do

    it "raises exception when topped up over the balance limit" do
      expect{ subject.top_up 91 }.to raise_error "Balance cannot exceed #{limit}"
    end

  end

end
