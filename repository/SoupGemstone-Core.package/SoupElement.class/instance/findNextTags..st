finding tags
findNextTags: anObject 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findNextTags: findBlock stream: aStream ]