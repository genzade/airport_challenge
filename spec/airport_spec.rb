require 'airport'

describe Airport do 
	let(:plane) { Plane.new }
	it { is_expected.to respond_to :take_off }

	it 'plane to land at an airport and confirm that it has landed' do
		airport = Airport.new
		expect(airport.land(plane)).to eq plane
	end

	#it 'plane to take off and confirm that it is no longer in the airport' do
		#airport = Airport.new

	#end


end