as yet unclassified
parseCData: anInteger
	| matcher end data |
	matcher := '\]\]>' asRegex.
	(matcher searchStream: (self readStreamFrom: anInteger))
		ifTrue: [end := matcher subBeginning: 1]
		ifFalse: [end := string size].
	data := string copyFrom: anInteger + 10 to: (matcher subBeginning: 1).
	self handleCData: data.
	^ matcher subEnd: 1
