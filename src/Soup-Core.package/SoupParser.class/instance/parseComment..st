parsing
parseComment: anInteger
	| matcher |
	matcher := '--\s*>' asRegex.
	(matcher searchStream: (self readStreamFrom: anInteger))
		ifTrue: [
			self handleComment: (string 
				copyFrom: anInteger + 5 
				to: (matcher subBeginning: 1) first).
			^( matcher subEnd: 1) first.
		].
	^ self parseIncomplete: anInteger
		
	
	
