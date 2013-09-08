parsing
parseEndTag: anInteger
	| end tag |
	(endBracket searchStream: (self readStreamFrom: anInteger  + 2)) 
		ifFalse: [^ self parseIncomplete: anInteger].
	end := (endBracket subEnd: 1) first.
	tag := string copyFrom: anInteger + 3 to: end - 1. 
	self handleEndTagFrom: anInteger + 1 to: end tag: tag.
	literal := false.
	^ end
