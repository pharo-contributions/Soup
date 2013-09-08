finding tags
findTagByClass: aString ifAbsent: aBlock
	self findTag: [:aTag | self hasClass: aString]
		ifPresent: [:aTag | ^ aTag].
	^ aBlock value
