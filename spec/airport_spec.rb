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
	
end