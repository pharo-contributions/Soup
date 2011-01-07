finding strings
findNextSiblingStrings: anObject 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findNextSiblingStrings: findBlock stream: aStream
	]