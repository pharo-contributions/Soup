as yet unclassified
pushTag: aTag
	"currentTag ifNotNil: [aTag parent: currentTag]."
	tagStack addLast: aTag.
	currentTag := aTag.
