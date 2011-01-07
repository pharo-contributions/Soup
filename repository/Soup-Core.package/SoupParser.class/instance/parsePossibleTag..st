parsing
parsePossibleTag: anInteger
	^ (startTagOpen matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifTrue: [self parsePossibleStartTag: anInteger]
		ifFalse: [self parsePossibleOtherTag: anInteger]
