as yet unclassified
parseDeclaration: anInteger
	| matcher |
	matcher := '<!\s*((''[^'']*''|"["]*"|\w+)(\s+(''[^'']*''|"["]*"|\w+)))*>' asRegex.
	^ (matcher matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifTrue: [
			self handleDeclaration: (matcher subexpression: 2).
			matcher subEnd: 1.
		]
		ifFalse: [self parseIncomplete: anInteger]
	
