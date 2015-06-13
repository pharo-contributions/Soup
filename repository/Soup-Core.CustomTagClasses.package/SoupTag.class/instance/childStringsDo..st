enumerating
childStringsDo: aBlock
	"Apply the argument, an Unary block, on the direct children that are plain strings. Strings decorated (e.g., <p>, <b>...) are not iterated"
	
	self childrenDo: 
		[ :anElement |
			anElement ifString: [aBlock value: anElement]]