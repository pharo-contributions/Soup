enumerating
childTagsDo: aBlock
	self childrenDo: [
		:anElement |
		anElement ifTag: [aBlock value: anElement]
	]