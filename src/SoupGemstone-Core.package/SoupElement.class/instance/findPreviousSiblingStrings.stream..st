finding strings
findPreviousSiblingStrings: anObject stream: aStream
	| findBlock |
	previousSibling ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(previousSibling isString and: [findBlock value: previousSibling]) 
		ifTrue: [aStream nextPut: previousSibling].
	previousSibling findPreviousSiblingStrings: anObject stream: aStream
