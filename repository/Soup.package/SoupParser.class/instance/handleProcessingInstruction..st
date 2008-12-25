as yet unclassified
handleProcessingInstruction: aString
	self endData.
	self handleData: aString.
	self endData: SoupProcessingInstruction 

	
