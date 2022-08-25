finding tags
findAllChildTags: anObject stream: aStream
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [ :aTag |
			(findBlock value: aTag) ifTrue: [aStream nextPut: aTag]].