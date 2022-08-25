finding tags
findTag: anObject ifPresent: aBlock
	| found |
	found := self findTag: anObject.
	^ found ifNotNil: [aBlock value: found]
