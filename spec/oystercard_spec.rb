require './lib/oystercard'

describe Oystercard do

  it { is_expected.to respond_to(:balance)}

  it "#balance" do
    expect(subject.balance).to eq(0)
  end

  it "#top_up" do
    expect{ subject.top_up(5) }.to change{ subject.balance }.by 5
  end

  it "has a balance limit of 90" do
    expect(Oystercard::BALANCE_LIMIT).to eq 90
  end


end
