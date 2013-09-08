parsing
parseIncomplete: anInteger
	| j |
	(incomplete matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifFalse: [
			self handleDataFrom: anInteger to: anInteger.
			^ anInteger + 1
		].
	j := (incomplete subEnd: 1) first.
	j >= string size ifTrue: [^ -1].
	self handleDataFrom: anInteger + 1 to: j.
	^ j
	

	
	
