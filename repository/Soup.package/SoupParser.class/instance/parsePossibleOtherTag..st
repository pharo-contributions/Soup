as yet unclassified
parsePossibleOtherTag: anInteger
	^ ((string at: anInteger+2) = $/) 
		ifTrue: [self parseEndTag: anInteger]
		ifFalse: [self parsePossibleSpecialTag: anInteger]
