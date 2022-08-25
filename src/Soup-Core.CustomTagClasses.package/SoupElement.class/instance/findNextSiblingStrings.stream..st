finding strings
findNextSiblingStrings: anObject stream: aStream
	| findBlock |
	nextSibling ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(nextSibling isString and: [findBlock value: nextSibling]) 
		ifTrue: [aStream nextPut: nextSibling].
	nextSibling findNextSiblingStrings: anObject stream: aStream
