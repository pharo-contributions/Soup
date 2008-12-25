enumerating
childStringsDo: aBlock
	self childrenDo: [
		:anElement |
		anElement ifString: [aBlock value: anElement]
	]