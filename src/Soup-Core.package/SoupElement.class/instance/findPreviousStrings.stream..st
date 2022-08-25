finding strings
findPreviousStrings: anObject stream: aStream
	| findBlock |
	previous ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(previous isString and: [findBlock value: previous]) ifTrue: [aStream nextPut: previous].
	previous findPreviousStrings: anObject stream: aStream
