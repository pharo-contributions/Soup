as yet unclassified
popToTag: aString inclusive: aBoolean
	| numPops mostRecentTag |
	(aString = '[document]') ifTrue: [^ self].
	numPops := self numPops: aString.
	mostRecentTag := nil.
	aBoolean ifFalse: [numPops := numPops - 1].
	numPops timesRepeat: [mostRecentTag := self popTag].
	^ mostRecentTag
