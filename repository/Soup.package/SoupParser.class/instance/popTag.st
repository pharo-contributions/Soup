as yet unclassified
popTag
	tagStack removeLast.
	tagStack isEmpty ifFalse: [currentTag := tagStack last].
	^ currentTag
