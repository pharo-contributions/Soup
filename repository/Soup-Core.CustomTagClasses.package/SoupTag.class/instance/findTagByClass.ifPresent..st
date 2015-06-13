finding tags
findTagByClass: aString ifPresent: aBlock
	^ self 
		findTag: [:aTag | self hasClass: aString]
		ifPresent: aBlock
