handling
parseAny: anInteger
	| i j |
	i := anInteger.
	j := self findInterestingFrom: i.
	i < j ifTrue: [self handleDataFrom: i + 1 to: j].
	i := j.
	i >= string size ifTrue: [^ string size].
	^ ((string at: i + 1) = $<) 
		ifTrue: [self parsePossibleTag: i]
		ifFalse: [self parsePossibleRef: i]
