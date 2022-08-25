parsing
parseLiteral: anInteger
	| i |
	i := anInteger + 1.
	self handleDataFrom: i to: i.
	^ i
	
	
