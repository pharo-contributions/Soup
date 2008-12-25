finding tags
findNextSiblingTags: anObject 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findNextSiblingTags: findBlock stream: aStream
	]