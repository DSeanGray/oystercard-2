require './lib/journey'

describe Journey do

  it 'links to the journey class' do
   expect(described_class).to eq Journey
 end

 it 'starts a journey' do
  expect(subject.start_journey).to eq true
 end

end
