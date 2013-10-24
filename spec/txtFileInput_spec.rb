require 'txtFileInput'

describe 'TxtFileInput' do
	before :each do
		@txtFile = "$1299.99 \n 3 people \n food"
		@fileLines = ['$1299.99','3','food']
	end

	it 'should parse a text file into an array of strings' do
		expect(@txtFile.split(/\n/)).to be_a(Array)
	end

	describe 'converting txt file to type hash' do
		it 'should return a hash containing product attributes' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			expect(fileOutput).to be_a(Hash)
		end
		it 'should have a key basePrice' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			fileOutput.should have_key(:basePrice)
		end
		it 'should have a key basePrice with value type Float' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			expect(fileOutput[:basePrice]).to be_a(Float)
		end
		it 'should have a key numPeople' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			fileOutput.should have_key(:numPeople)
		end
		it 'should have a key numPeople with value type Integer' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			expect(fileOutput[:numPeople]).to be_a(Integer)
		end
		it 'should have a key type' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			fileOutput.should have_key(:type)
		end
		it 'should have a key type with value type String' do
			fileOutput = TxtFileInput.txtFileToHash(@fileLines)
			expect(fileOutput[:type]).to be_a(String)
		end
	end

end