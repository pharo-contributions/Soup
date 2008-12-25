as yet unclassified
parseCharRef: anInteger
	| name i |
	name := charRef subexpression: 2.
	self handleCharRef: name.
	i := charRef subEnd: 2.
	^ i + 1