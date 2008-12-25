as yet unclassified
parseProcessingInstruction: anInteger
	| matcher |
	matcher := '>' asRegex.
	^ (matcher searchStream: (self readStreamFrom: anInteger))
		ifTrue: [
			|  processingInstruction |
			processingInstruction := string 
				copyFrom: anInteger + 3 
				to: (matcher subBeginning: 1).
			self handleProcessingInstruction: processingInstruction.
			matcher subEnd: 1.
		]
		ifFalse: [self parseIncomplete: anInteger]
