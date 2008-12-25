finding strings
findChildString: anObject
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	self childStringsDo: [
		:aString |
		(findBlock value: aString)  ifTrue: [^ aString].
	].
	^ nil