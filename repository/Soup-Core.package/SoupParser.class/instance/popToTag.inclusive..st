handling
popToTag: aString inclusive: aBoolean
	| numPops |
	(aString = Soup defaultName) ifTrue: [^ self].
	numPops := self numPops: aString.
	aBoolean ifFalse: [numPops := numPops - 1].
	numPops timesRepeat: [self popTag].
