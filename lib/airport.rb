#require_relative 'plane'

class Airport

	attr_accessor :capacity

	DEFUALT_CAPACITY = 20

	def initialize(capacity=DEFUALT_CAPACITY)
		@capacity = capacity
		@planes = []
	end
	
	def land(plane)
		fail 'Cannot land plane - airport full' if full?
		fail 'Cannot land plane - bad weather' if stormy?
		@planes << plane
		'Plane has landed'
	end

	def take_off(plane)
		fail 'Cannot take off plane - bad weather' if stormy?
		'Plane has taken off'
	end

	private

	attr_reader :planes

	def full?
		@planes.length >= @capacity
	end

	def stormy?
		rand(1..6) > 4
	end

end