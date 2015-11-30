require 'airport'

describe Airport do 
	subject(:airport) { described_class.new(20) }
	let(:plane) { Plane.new } # can use a double block
	describe '#land' do
		context 'When not stormy' do
			before do
				allow(airport).to receive(:stormy?).and_return false
			end

			it 'Instruct a plane to land' do
				expect(airport).to respond_to(:land).with(1).argument
			end

			it 'Land at airport and confirm it has landed' do
				expect(airport.land(plane)).to eq 'Plane has landed'
			end
			context 'When full' do
				it 'Does not allow landing' do
					plane = double :plane
					20.times do
						airport.land(plane)
					end
					expect { airport.land(plane) }.to raise_error 'Cannot land plane - airport full'
				end
			end
		end

		context 'When stormy' do
			it 'Prevents landing' do
				allow(airport).to receive(:stormy?).and_return true
				expect { airport.land(plane) }.to raise_error 'Cannot land plane - bad weather'
			end
		end
	end

	describe '#take_off' do
		context 'When not stormy' do
			before do
				allow(airport).to receive(:stormy?).and_return false
			end
			it 'Instruct plane to take off' do
				expect(airport).to respond_to(:take_off).with(1).argument
			end

			it 'Confirm it no longer in airport' do
				expect(airport.take_off(:plane)).to eq 'Plane has taken off'
			end
		end

		context 'When stormy' do

			before do
				allow(airport).to receive(:stormy?).and_return true
			end

			it 'Prevents take off' do
				expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane - bad weather'
			end
		end
	end

end