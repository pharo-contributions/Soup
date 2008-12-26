parsing
parseProcessingInstruction: anInteger
	| end |
	end := string findString: '>' startingAt: anInteger.
	(end > 0)
		ifTrue: [
			|  processingInstruction |
			processingInstruction := string 
				copyFrom: anInteger + 3 
				to: end - 1.
			self handleProcessingInstruction: processingInstruction.
			^ end
		].
	^ self parseIncomplete: anInteger
