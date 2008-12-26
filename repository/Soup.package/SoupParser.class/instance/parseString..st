parsing
parseString: aString
	string := aString.
	self reset.
	self massage.
	self parse.
	self endData.
	[tagStack last isSoup] whileFalse: [self popTag].
	^ tagStack last