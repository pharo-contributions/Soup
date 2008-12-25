as yet unclassified
handleCData: aString
	self endData.
	self handleData: aString.
	self endData: SoupCData.

	
