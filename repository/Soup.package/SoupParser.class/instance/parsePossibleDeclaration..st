as yet unclassified
parsePossibleDeclaration: anInteger
	^ (self equals: '<![CDATA[' from: anInteger)
		ifTrue: [self parseCData: anInteger]
		ifFalse: [self parseDeclaration: anInteger]
	
	
