require_relative 'product.rb'
require_relative 'txtFileInput.rb'
require_relative 'markupCalculator.rb'

class Main

	file = TxtFileInput.parseTxtFile('inputFiles/input3.txt')
	product = Product.new(file[:basePrice], file[:numPeople], file[:type])
	output = '$' + MarkupCalculator.markupCalc(product).to_s
	puts output

end