require 'markupCalculator'
require 'product'

describe 'MarkupCalculator' do
	before(:each) do
		@product = Product.new(1299.99, 3, 'food')
	end

	describe 'calculating the base price with flat markup' do
		it 'should calculate the base price with flat markup' do
			basePrice = @product.basePrice
			expected_markup = basePrice*(1+0.05)
			actual_markup = MarkupCalculator.flatMarkup(basePrice)
			actual_markup.should be_within(0.0001).of(expected_markup)
		end

		it 'should return a float' do
			markup = MarkupCalculator.flatMarkup(@product.basePrice)
			expect(markup).to be_a(Float)
		end
	end

	describe 'calculating the number of people markup' do
		it 'should calculate the markup based on number of people' do
			flatMarkupPrice = 1200
			expected_markup = flatMarkupPrice*3*0.012
			actual_markup = MarkupCalculator.peopleMarkup(flatMarkupPrice,@product.numPeople)
			actual_markup.should be_within(0.0001).of(expected_markup)
		end

		it 'should return a float' do
			markup = MarkupCalculator.flatMarkup(@product.basePrice)
			expect(markup).to be_a(Float)

		end

	end 

	describe 'determining the material type' do
		it 'should determine the material type of the object' do
			type = MarkupCalculator.sortProductType(@product.type)
			expect(type).to eq('food')

			type = MarkupCalculator.sortProductType('drugs')
			expect(type).to eq('pharmaceuticals')

			type = MarkupCalculator.sortProductType('books')
			expect(type).to eq('other')
		end

		it 'should return a material type of type String' do
			type = MarkupCalculator.sortProductType(@product.type)
			expect(type).to be_a(String)
		end
	end 

	describe 'calculating the markup based on material type' do
		it 'should calculate the markup for a material type of food' do
			actual_markup = MarkupCalculator.productTypeMarkup(1200, 'food')
			expected_markup = 1200 * 0.13
			actual_markup.should be_within(0.0001).of(expected_markup)
		end
		it 'should calculate the markup for a material type of pharmaceuticals' do
			actual_markup = MarkupCalculator.productTypeMarkup(1200, 'drugs')
			expected_markup = 1200 * 0.075
			actual_markup.should be_within(0.0001).of(expected_markup)
		end
		it 'should calculate the markup for a material type of electronics' do
			actual_markup = MarkupCalculator.productTypeMarkup(1200, 'electronics')
			expected_markup = 1200 * 0.02
			actual_markup.should be_within(0.0001).of(expected_markup)
		end
		it 'should be a float' do
			markup = MarkupCalculator.productTypeMarkup(1200, 'electronics')
			expect(markup).to be_a(Float)
		end
	end

	describe 'calculating the total price with all markups' do
		it 'should calculate the sum of individual markups on top of the base price' do
			priceWithFlatMarkup = 1200
			peopleMarkup = 60
			materialMarkup = 100
			expected_total = priceWithFlatMarkup + peopleMarkup + materialMarkup
			actual_total = MarkupCalculator.totalMarkup(priceWithFlatMarkup, peopleMarkup, materialMarkup)
			expect(actual_total).to equal(expected_total)
		end

		it 'should be a float' do
			total = MarkupCalculator.totalMarkup(1299.99, 60.0, 100.0)
			expect(total).to be_a(Float)
		end

		it 'should properly calculate the total output price' do
			expected_total = 1591.58
			actual_total = MarkupCalculator.markupCalc(@product)
			actual_total.should be_within(0.0001).of(expected_total)
		end
	end
end

