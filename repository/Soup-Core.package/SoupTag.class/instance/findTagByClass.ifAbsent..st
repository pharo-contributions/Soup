finding tags
findTagByClass: aString ifAbsent: aBlock
	self findTag: [:aTag | (aTag attributeAt: 'class') = aString]
		ifPresent: [:aTag | ^ aTag].
	^ aBlock value
