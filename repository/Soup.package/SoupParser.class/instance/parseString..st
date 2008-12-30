parsing
parseString: aString
	string := aString.
	self decode.
	self reset.
	self massage.
	self parse.
	self endData.
	[tagStack last isSoup] whileFalse: [self popTag].
	^ tagStack last