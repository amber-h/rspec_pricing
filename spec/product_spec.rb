require 'product'

describe "Product" do

	before(:each) do
		@product = Product.new(1299.99, 3, 'food')
	end

	it "should initialize" do
		expect(@product).to be_a(Product)
	end

	it 'should have a product type of type String' do
		expect(@product.type).to be_a(String)
	end

	it 'should have a number of people of type Integer' do
		expect(@product.numPeople).to be_a(Integer)
	end

	it 'should have a base price of type float' do
		expect(@product.basePrice).to be_a(Float)
	end


end