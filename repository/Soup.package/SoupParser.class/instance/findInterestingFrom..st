parsing
findInterestingFrom: anInteger
	^ (interesting searchStream: (self readStreamFrom: anInteger))
		ifTrue: [(interesting subBeginning: 1) first]
		ifFalse: [string size]
