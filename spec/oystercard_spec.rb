require './lib/oystercard'

describe Oystercard do
  limit = Oystercard::BALANCE_LIMIT
  min_fare = Oystercard::MIN_FARE

  it "#balance" do
    expect(subject.balance).to eq(0)
  end

  it "#top_up" do
    expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
  end

  it "has a balance limit of 90" do
    expect(limit).to eq 90
  end

  it "raises exception when topped up over the balance limit" do
    expect{ subject.top_up 91 }.to raise_error "Balance cannot exceed #{limit}"
  end

  it "#deduct" do
    subject.top_up(30)
    expect{ subject.deduct(20) }.to change{ subject.balance }.by -20
  end

  it "#in_journey?" do
    expect(subject.in_journey?).to eq(false)
  end

  it "#touch_in" do
    subject.top_up 5
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end

  it "#touch_out" do
    subject.top_up 5
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to eq false
  end

  it "raises exception when trying to touch in with balance below 1" do
    expect{ subject.touch_in }.to raise_error "Insufficient funds"
  end

  it "has a minimum fare of 1" do
    expect(min_fare).to eq 1
  end

  it "deducts fare when touch_out" do
    expect{ subject.touch_out }.to change{ subject.balance }.by -min_fare
  end




end
