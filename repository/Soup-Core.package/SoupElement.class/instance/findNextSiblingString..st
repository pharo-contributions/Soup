finding strings
findNextSiblingString: anObject
	| findBlock |
	nextSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isString and: [findBlock value: nextSibling]) 
		ifTrue: [^ nextSibling].
	^ nextSibling findNextSiblingString: anObject