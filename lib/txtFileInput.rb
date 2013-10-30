class TxtFileInput

	def self.parseTxtFile(txtFile)
	 	fileLines = readTxtFile(txtFile)
	 	fileOutput = txtFileToHash(fileLines)
	end

	def self.readTxtFile(txtFile)
		fileLines = File.open(txtFile, 'r').read.split(/\n/)
	end

	def self.txtFileToHash(fileLines)
		fileOutput = {}
	 	fileOutput[:basePrice] = fileLines[0].strip.sub('$','').to_f
	 	fileOutput[:numPeople] = fileLines[1].strip.to_i
	 	fileOutput[:type] = fileLines[2].strip
	 	fileOutput

	end

end