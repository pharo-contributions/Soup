finding tags implementation
findNextTags: anObject stream: aStream
	| findBlock |
	next ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(next isTag and: [findBlock value: next]) ifTrue: [aStream nextPut: next].
	next findNextTags: anObject stream: aStream
