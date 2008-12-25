finding tags
findPreviousTag: anObject
	| findBlock |
	previous ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(findBlock value: previous) ifTrue: [^ previous].
	^ previous findPreviousTag: anObject