finding tags
findNextSiblingTag: anObject
	"Return the next sibling tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	nextSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isTag and: [findBlock value: nextSibling]) 
		ifTrue: [^ nextSibling].
	^ nextSibling findNextSiblingTag: anObject