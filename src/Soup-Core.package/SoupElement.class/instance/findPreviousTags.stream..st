finding tags implementation
findPreviousTags: anObject stream: aStream
	| findBlock |
	previous ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(previous isTag and: [findBlock value: previous]) ifTrue: [aStream nextPut: previous].
	previous findPreviousTags: anObject stream: aStream
