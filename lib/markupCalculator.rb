class MarkupCalculator
	FLAT_MARKUP = 0.05
	PEOPLE_MARKUP = 0.012

	$materialsMarkup = {}
	$materialsMarkup[:pharmaceuticals] = 0.075
	$materialsMarkup[:food] = 0.13
	$materialsMarkup[:electronics] = 0.02
	$materialsMarkup[:other] = 0

	$foodTypes = []
	$foodTypes.push('food')

	$pharmaceuticalTypes = []
	$pharmaceuticalTypes.push('drugs')

	$electronicsTypes = []
	$electronicsTypes.push('electronics')

	def self.markupCalc(product)
		flatM = flatMarkup(product.basePrice)
		peopleM = peopleMarkup(flatM, product.numPeople)
		productM = productTypeMarkup(flatM, product.type)
		total = totalMarkup(flatM, peopleM, productM).round(2)
	end

	def self.flatMarkup(basePrice)
		hello = basePrice * ( 1 + FLAT_MARKUP )
		basePrice*( 1 + 0.05 )
	end

	def self.peopleMarkup(priceWithFlatMarkup, numPeople)
		priceWithFlatMarkup * (numPeople * PEOPLE_MARKUP)
	end

	def self.productTypeMarkup(priceWithFlatMarkup, productType)
		type = sortProductType(productType)
		priceWithFlatMarkup * $materialsMarkup[type.to_sym]

	end

	def self.totalMarkup(priceWithFlatMarkup, peopleMarkup, productTypeMarkup)
		total = priceWithFlatMarkup + peopleMarkup + productTypeMarkup
	end

	def self.sortProductType(productType)
		if $foodTypes.include?(productType)
			'food'
		elsif $pharmaceuticalTypes.include?(productType)
			'pharmaceuticals'
		elsif $electronicsTypes.include?(productType)
			'electronics'
		else
			'other'
		end
	end
end