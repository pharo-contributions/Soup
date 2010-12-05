accessing
string
	^ (children size = 1 and: [(children at: 1) isString])
				ifTrue: [(children at: 1) contents]
				ifFalse: [nil]