finding strings
findNextString: anObject
	| findBlock |
	next ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(next isString and: [findBlock value: next]) ifTrue: [^ next].
	^ next findNextString: anObject