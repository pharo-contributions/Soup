finding strings
findAllStrings: anObject
	| block |
	block := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findAllStrings: block stream: aStream
	]