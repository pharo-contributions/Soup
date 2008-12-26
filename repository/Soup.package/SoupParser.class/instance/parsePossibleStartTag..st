parsing
parsePossibleStartTag: anInteger
	literal ifTrue: [^ self parseLiteral: anInteger].
	^ self parseStartTag: anInteger
	
