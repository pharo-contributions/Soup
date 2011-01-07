instance creation
fromString: aString
	^ (SoupParser parameters: self defaultParserParameters) 
		parseString: aString