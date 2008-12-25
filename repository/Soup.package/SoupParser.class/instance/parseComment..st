as yet unclassified
parseComment: anInteger
	| matcher |
	matcher := '--\s*>' asRegex.
	^ (matcher searchStream: (self readStreamFrom: anInteger))
		ifTrue: [
			|  comment |
			comment := string copyFrom: anInteger + 5 to: (matcher subBeginning: 1).
			self handleComment: comment.
			matcher subEnd: 1.
		]
		ifFalse: [self parseIncomplete: anInteger]
		
	
	
