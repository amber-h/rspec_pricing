require 'txtFileInput'

describe 'TxtFileInput' do
	before :each do
		@txtFile = "$1299.99 \n 3 people \n food"
	end

	it 'should parse a text file into an array of strings' do
		expect(@txtFile.split(/\n/)).to be_a(Array)
	end

	it 'should initially set the fileOuput to an empty hash' do
		# fileOutput =
		# expect(@txtFile.split(/\n/)).to be_a(Array)
	end

end