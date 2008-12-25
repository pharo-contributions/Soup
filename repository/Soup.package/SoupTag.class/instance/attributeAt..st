accessing
attributeAt: aString 
	^ attributes at: aString ifAbsent: [nil]