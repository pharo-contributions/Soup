parsing
parsePossibleLiteral: anInteger
	^ (string size > (anInteger + 1))
		ifTrue: [self parseLiteral: anInteger]
		ifFalse: [self parseIncomplete: anInteger]