finding strings
findString: anObject ifPresent: aBlock
	| found |
	found := self findString: anObject.
	^ found ifNotNil: [aBlock value: found]