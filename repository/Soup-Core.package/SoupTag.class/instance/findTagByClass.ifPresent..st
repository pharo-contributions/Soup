finding tags
findTagByClass: aString ifPresent: aBlock
	^ self 
		findTag: [:aTag | aTag hasClass: aString]
		ifPresent: aBlock
