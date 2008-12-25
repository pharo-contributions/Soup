as yet unclassified
parseStartTag: anInteger
	^ (endBracket searchStream: (string readStream position: anInteger + 1))
		ifFalse: [-1]
		ifTrue: [
			| j k attrs done |
			attrs := Dictionary new.
			j := endBracket subBeginning: 1.
			(tagFind matchesStreamPrefix: (string readStream position: anInteger + 1))
				ifFalse: [self error: '#parseStartTagFrom: should not have been sent']
				ifTrue: [
					k := tagFind subEnd: 1.
					lastTag := (tagFind subexpression: 1) asLowercase
				].
			done := (k <= j) not.
			[done] whileFalse: [
				(attrFind matchesStreamPrefix: (string readStream position: k))
					ifFalse: [done := true]
					ifTrue: [
						| attrName rest attrValue |
						attrName := attrFind subexpression: 2.
						rest := attrFind subexpression: 3.
						attrValue := attrFind subexpression: 4.
						rest 
							ifNil: [attrValue := attrName]
							ifNotNil: [attrValue ifNotEmpty: [
								((attrValue first = $' and: [attrValue last = $']) or: [attrValue first = $" and: [attrValue last = $"]])
									ifTrue: [attrValue := attrValue copyFrom: 2 to: (attrValue size - 1)].
								attrValue := self copy: attrValue replace: '&(([a-zA-Z][-.a-zA-Z0-9]*)|#(\w+))(;)?' using: [:aMatcher | self convertRef: aMatcher].
							]].
						attrs at: attrName put: attrValue.
						k := attrFind subEnd: 1.
						(k <= j) ifFalse: [done := true].
					].
			].
			self handleStartTagFrom: anInteger to: j tag: lastTag attrs: attrs.
			(string at: j + 1) = $> ifTrue: [j := j + 1].
			j.
		]
		
	
	