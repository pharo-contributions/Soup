finding tags implementation
findPreviousSiblingTags: anObject stream: aStream
	| findBlock |
	previousSibling ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(previousSibling isTag and: [findBlock value: previousSibling]) 
		ifTrue: [aStream nextPut: previousSibling].
	previousSibling findPreviousSiblingTags: anObject stream: aStream
