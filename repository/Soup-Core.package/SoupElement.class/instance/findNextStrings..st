finding strings
findNextStrings: anObject 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findNextStrings: findBlock stream: aStream
	]