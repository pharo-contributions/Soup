finding tags
findPreviousSiblingTags: anObject 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findPreviousSiblingTags: findBlock stream: aStream
	]