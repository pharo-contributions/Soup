finding strings
findPreviousStrings: anObject 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findPreviousStrings: findBlock stream: aStream
	]