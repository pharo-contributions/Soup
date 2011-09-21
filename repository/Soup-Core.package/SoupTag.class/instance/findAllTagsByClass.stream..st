finding tags
findAllTagsByClass: aString stream: aStream 
	self childTagsDo: 
		[ :aTag | 
		(aTag hasClass: aString)
			ifTrue: [ aStream nextPut: aTag ].
		aTag 
			findAllTagsByClass: aString
			stream: aStream ]