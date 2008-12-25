as yet unclassified
findInterestingFrom: anInteger
	^ (interesting searchStream: (self readStreamFrom: anInteger))
		ifTrue: [interesting subBeginning: 1]
		ifFalse: [string size]
