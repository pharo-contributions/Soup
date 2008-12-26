handling
handleDeclaration: aString
	self endData.
	self handleData: aString.
	self endData: SoupDeclaration.

	
