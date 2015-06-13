finding tags implementation
findNextSiblingTags: anObject stream: aStream
	| findBlock |
	nextSibling ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isTag and: [findBlock value: nextSibling]) 
		ifTrue: [aStream nextPut: nextSibling].
	nextSibling findNextSiblingTags: anObject stream: aStream
