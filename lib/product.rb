class Product
	attr_accessor :basePrice, :numPeople, :type

	def initialize(basePrice, numPeople, type)
		@basePrice = basePrice
		@numPeople = numPeople
		@type = type
	end
end