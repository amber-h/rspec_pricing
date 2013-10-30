require_relative 'listofMaterials.rb'

class MarkupCalculator
	FLAT_MARKUP = 0.05
	PEOPLE_MARKUP = 0.012

	def self.markupCalc(product)
		flatM = flatMarkup(product.basePrice)
		peopleM = peopleMarkup(flatM, product.numPeople)
		productM = productTypeMarkup(flatM, product.type)
		total = totalMarkup(flatM, peopleM, productM).round(2)
	end

	def self.flatMarkup(basePrice)
		basePrice*( 1 + FLAT_MARKUP )
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