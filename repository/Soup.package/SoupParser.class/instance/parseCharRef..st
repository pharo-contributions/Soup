parsing
parseCharRef: anInteger
	self handleCharRef: (charRef subexpression: 2).
	^ (charRef subEnd: 2) + 1
