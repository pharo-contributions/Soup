parsing
parseStartTag: anInteger
	| j k tag attrs |
	(endBracket searchStream: (self readStreamFrom: anInteger + 1))
		ifFalse: [^ self parseIncomplete: anInteger].
	attrs := Dictionary new.
	j := (endBracket subBeginning: 1) first.
	(tagFind matchesStreamPrefix: (self readStreamFrom: anInteger + 1))
		ifFalse: [self error: '#parseStartTagFrom: should not have been sent']
		ifTrue: [
			k := (tagFind subEnd: 1) first.
			tag := (tagFind subexpression: 1) asLowercase
		].
	[k < j] whileTrue: [
		k := self parseStartTagAttribute: k into: attrs.
		(k = -1) ifTrue: [k := j]
	].
	self handleStartTagFrom: anInteger to: j tag: tag attrs: attrs.
	(string at: j + 1) = $> ifTrue: [j := j + 1].
	^ j
