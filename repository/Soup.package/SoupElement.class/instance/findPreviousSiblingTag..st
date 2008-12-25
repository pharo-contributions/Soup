finding tags
findPreviousSiblingTag: anObject
	| findBlock |
	previousSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(findBlock value: previousSibling) ifTrue: [^ previousSibling].
	^ previousSibling findPreviousSiblingTag: anObject