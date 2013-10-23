require 'product'

describe "Product" do

	before(:each) do
		@product = Product.new(1299.99, 3, 'food')
	end

	it "should initialize" do
		expect(@product).to be_a(Product)
	end

	it 'should have a product type of type String' do
		@product.type = 'food'
		expect(@product.type).to be_a(String)
	end
end