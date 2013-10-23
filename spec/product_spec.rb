require 'product'

describe "Product" do

	before(:each) do
		@product = Product.new
	end

	it "should initialize" do
		expect(@product).to be_a(Product)
	end
end