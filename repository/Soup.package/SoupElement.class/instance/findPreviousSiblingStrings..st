finding strings
findPreviousSiblingStrings: anObject 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findPreviousSiblingStrings: findBlock stream: aStream
	]