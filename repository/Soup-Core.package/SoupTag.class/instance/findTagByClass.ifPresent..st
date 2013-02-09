finding tags
findTagByClass: aString ifPresent: aBlock
	^ self 
		findTag: [:aTag | (aTag attributeAt: 'class') = aString]
		ifPresent: aBlock
