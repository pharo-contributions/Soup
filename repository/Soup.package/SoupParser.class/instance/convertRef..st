converting
convertRef: aMatcher
	(aMatcher subexpression: 3) 
		ifNotEmpty: [
			^ (self convertCharRef: (aMatcher subexpression: 3))
				ifNil: [aMatcher subexpression: 1]
		].
	(aMatcher subexpression: 4)
		ifNotEmpty: [
			^ (self convertEntityRef: (aMatcher subexpression: 4))
				ifNil: [aMatcher subexpression: 1]
		].
	^ aMatcher subexpression: 1
