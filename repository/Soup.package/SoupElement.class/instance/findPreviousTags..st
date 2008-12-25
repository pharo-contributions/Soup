finding tags
findPreviousTags: anObject 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findPreviousTags: findBlock stream: aStream
	]