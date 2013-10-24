module TxtFileInput

	def self.parseTxtFile(txtFile)
	 	fileLines = File.open(txtFile, 'r').read.split(/\n/)

		fileOutput = {}
	 	fileOutput[:basePrice] = fileLines[0].strip.sub('$','').to_f
	 	fileOutput[:numPeople] = fileLines[1].strip.to_i
	 	fileOutput[:type] = fileLines[2].strip

	 	return fileOutput
	end

end