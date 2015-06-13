parsing
parsePossibleSpecialTag: anInteger
	literal ifTrue: [^ self parsePossibleLiteral: anInteger].
	(self equals: '<!--' from: anInteger) 
		ifTrue: [^ self parseComment: anInteger].
	((string at: anInteger + 2) = $?)  
		ifTrue: [^ self parseProcessingInstruction: anInteger].
	((string at: anInteger + 2) = $!)  
		ifTrue: [^ self parsePossibleDeclaration: anInteger].
	^ self parseIncomplete: anInteger
	
	
