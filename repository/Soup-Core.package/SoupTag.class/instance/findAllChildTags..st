finding tags
findAllChildTags: anObject 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
		self findAllChildTags: findBlock stream: aStream ]