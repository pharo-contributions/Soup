converting
convertEntityRef: aString
	^ parameters entityDefinitions at: aString ifAbsent: [nil]
