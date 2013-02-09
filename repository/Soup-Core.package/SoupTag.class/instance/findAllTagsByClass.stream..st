finding tags
findAllTagsByClass: aString stream: aStream 
	self childTagsDo: 
		[ :aTag | 
		(aTag attributeAt: 'class') = aString  "extract this line ? used in findTagByClass:ifAbsent:"
			ifTrue: [aStream nextPut: aTag ].
		aTag 
			findAllTagsByClass: aString
			stream: aStream ]