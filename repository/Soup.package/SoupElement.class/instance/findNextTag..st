finding tags
findNextTag: anObject
	| findBlock |
	next ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(next isTag and: [findBlock value: next]) ifTrue: [^ next].
	^ next findNextTag: anObject