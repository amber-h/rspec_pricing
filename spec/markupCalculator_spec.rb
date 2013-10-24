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

	describe 'calculating the markup based on material type' do
		it 'should determine the material type of the object' do
			type = MarkupCalculator.sortProductType(@product.type)
			expect(type).to eq('food')
		end

		it 'should return a String' do
			type = MarkupCalculator.sortProductType(@product.type)
			expect(type).to be_a(String)
		end

	end 
end

