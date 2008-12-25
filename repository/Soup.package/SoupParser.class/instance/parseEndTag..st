as yet unclassified
parseEndTag: anInteger
	| j tag |
	(endBracket searchStream: (string readStream position: anInteger  + 2)) ifFalse: [^ -1].
	j := (endBracket subEnd: 1).
	tag := string copyFrom: anInteger + 3 to: j - 1. 
	self handleEndTagFrom: anInteger + 1 to: j tag: tag.
	literal := false.
	^ j 
