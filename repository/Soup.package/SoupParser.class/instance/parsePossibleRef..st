as yet unclassified
parsePossibleRef: anInteger
	literal ifTrue: [^ self parseLiteral: anInteger].
	(charRef matchesStreamPrefix: (string readStream position: anInteger)) ifTrue: [^ self parseCharRef: anInteger].
	(entityRef matchesStreamPrefix: (string readStream position: anInteger)) ifTrue: [^ self parseEntityRef: anInteger].
	^ self parseIncomplete: anInteger