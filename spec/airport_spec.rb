require 'airport'

describe Airport do 
	subject(:airport) { described_class.new }
	let(:plane) { Plane.new }

	it 'Instruct a plane to land' do
		expect(airport).to respond_to(:land).with(1).argument
	end

	it 'Land at airport and confirm it has landed' do
		expect(airport.land(plane)).to eq plane
	end
	
	it 'Instruct plane to take off' do
		expect(airport).to respond_to(:take_off).with(1).argument
	end

	it 'Confirm it no longer in airport' do
		expect(airport.take_off(plane)).to eq 'plane has taken off'
	end
end