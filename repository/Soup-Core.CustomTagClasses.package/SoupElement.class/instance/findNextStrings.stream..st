finding strings
findNextStrings: anObject stream: aStream
	| findBlock |
	next ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(next isString and: [findBlock value: next]) ifTrue: [aStream nextPut: next].
	next findNextStrings: anObject stream: aStream
