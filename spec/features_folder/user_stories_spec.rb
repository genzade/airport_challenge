=begin
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport and confirm that it has landed 

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate
=end

describe 'User Stories' do 
	let(:airport) { Airport.new(20)}
	let(:plane) { Plane.new }

	context 'When not stormy' do
		before do
			allow(airport).to receive(:stormy?).and_return false
		end
		it 'Instruct a plane to land at airport and confirm it has landed' do
			expect { airport.land(plane) }.not_to raise_error
		end

		it 'Instruct plane to take off and confirm it no longer in airport' do
			expect { airport.take_off(plane) }.not_to raise_error
		end

		context 'When airport is full' do
			it 'Prevents landing when the full' do
				20.times do
					airport.land(plane)
				end
				expect { airport.land(plane) }.to raise_error 'Cannot land plane - airport full'
			end
		end
	end

	context 'When weather stormy' do
		before do
			allow(airport).to receive(:stormy?).and_return true
		end

		it 'Prevents landing' do
			expect { airport.land(plane) }.to raise_error 'Cannot land plane - bad weather'
		end

		it 'Prevents take off' do
			expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane - bad weather'
		end

	end

end
