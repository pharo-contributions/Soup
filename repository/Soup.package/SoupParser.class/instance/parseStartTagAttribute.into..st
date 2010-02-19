parsing
parseStartTagAttribute: anInteger into: aDictionary
	| attrName rest attrValue |
	(attrFind matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifFalse: [^ -1].
	attrName := attrFind subexpression: 2.
	rest := attrFind subexpression: 3.
	attrValue := attrFind subexpression: 4.
	rest 
		ifNil: [attrValue := attrName]
		ifNotNil: [
			attrValue ifNotEmpty: [
				((attrValue first = $' and: [attrValue last = $']) 
					or: [attrValue first = $" and: [attrValue last = $"]])
					ifTrue: [
						attrValue := attrValue 
							copyFrom: 2 
							to: (attrValue size - 1)
					].
				attrValue := self 
					copy: attrValue 
					replace: refFind
					using: [:aMatcher | self convertRef: aMatcher].
			]
		].
	aDictionary at: attrName put: attrValue.
	^ (attrFind subEnd: 1) first.
