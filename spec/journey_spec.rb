require './lib/journey'
require './lib/oystercard'

describe Journey do

  it 'links to the journey class' do
   expect(described_class).to eq Journey
 end

 describe "#start_journey" do
   let(:station) { station = double}
   it 'starts a journey' do
     expect(subject.start_journey(station)).to eq station
     end
   end

   describe "#finish_journey" do
     let(:station) { station = double}
     it 'finishes a journey' do
       expect(subject.finish_journey(station)).to eq station
     end
   end

   describe "#journey_complete?" do
     it 'checks if a journey has been completed' do
       subject.start_journey("Bank")
       subject.finish_journey("Holborn")
       expect(subject.journey_complete?).to be true
     end
   end

   describe '#fare' do
     context 'when a journey is complete' do
     it 'returns the single journey fare' do
       subject.start_journey("Bank")
       subject.finish_journey("Holborn")
       expect(subject.fare).to eq 1
     end
   end

   context 'when a journey is not complete' do
     it 'returns the single journey penalty fare' do
       subject.start_journey("Bank")
       expect(subject.fare).to eq 6
     end
   end
 end

end
