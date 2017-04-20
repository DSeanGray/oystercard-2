require 'station'

describe Station do

  subject{described_class.new(name: "waterloo", zone: 1)}

  it 'holds station name' do
    expect(subject.name).to eq "waterloo"
  end

  it 'holds zone number' do
    expect(subject.zone).to eq 1
  end

end
