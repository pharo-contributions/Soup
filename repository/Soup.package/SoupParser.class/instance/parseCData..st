parsing
parseCData: anInteger
	| end |
	end := (string findString: ']]>' startingAt: anInteger) - 1.
	self handleCData: (string copyFrom: anInteger + 10 to: end).
	^ end + 3
