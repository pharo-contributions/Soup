finding strings
findPreviousString: anObject
	| findBlock |
	previous ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(previous isString and: [findBlock value: previous]) ifTrue: [^ previous].
	^ previous findNextString: anObject