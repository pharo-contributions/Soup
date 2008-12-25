as yet unclassified
parseString: aString
	string := aString.
	self feed.
	^ tagStack last