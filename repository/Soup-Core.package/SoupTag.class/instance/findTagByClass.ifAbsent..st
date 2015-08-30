finding tags
findTagByClass: aString ifAbsent: aBlock
	self findTag: [:aTag | aTag hasClass: aString]
		ifPresent: [:aTag | ^ aTag].
	^ aBlock value
