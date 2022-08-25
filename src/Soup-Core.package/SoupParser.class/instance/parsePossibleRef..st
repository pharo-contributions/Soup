parsing
parsePossibleRef: anInteger
	literal ifTrue: [^ self parseLiteral: anInteger].
	(charRef matchesStreamPrefix: (self readStreamFrom: anInteger)) 
		ifTrue: [^ self parseCharRef: anInteger].
	(entityRef matchesStreamPrefix: (self readStreamFrom: anInteger)) 
		ifTrue: [^ self parseEntityRef: anInteger].
	^ self parseIncomplete: anInteger