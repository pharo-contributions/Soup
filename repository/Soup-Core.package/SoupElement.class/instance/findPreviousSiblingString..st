finding strings
findPreviousSiblingString: anObject
	| findBlock |
	previousSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(previousSibling isString and: [findBlock value: previousSibling]) 
		ifTrue: [^ previousSibling].
	^ previousSibling findPreviousSiblingString: anObject