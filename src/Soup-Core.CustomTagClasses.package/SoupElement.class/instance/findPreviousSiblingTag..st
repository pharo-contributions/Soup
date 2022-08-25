finding tags
findPreviousSiblingTag: anObject
	"Return the previous sibling tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	previousSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(findBlock value: previousSibling) ifTrue: [^ previousSibling].
	^ previousSibling findPreviousSiblingTag: anObject