finding tags
findNextSiblingTag: anObject
	| findBlock |
	nextSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isTag and: [findBlock value: nextSibling]) 
		ifTrue: [^ nextSibling].
	^ nextSibling findNextSiblingTag: anObject