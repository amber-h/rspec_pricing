module MarkupCalculator
	FLAT_MARKUP = 0.05

	def flatMarkup(basePrice)
		basePrice * FLAT_MARKUP
	end

	def peopleMarkup(priceWithFlatMarkup, numPeople)
		priceWithFlatMarkup * (numPeople * 0.05)
	end

end