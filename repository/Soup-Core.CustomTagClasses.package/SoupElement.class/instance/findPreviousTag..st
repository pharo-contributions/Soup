finding tags
findPreviousTag: anObject
	"Return the next tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	previous ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(findBlock value: previous) ifTrue: [^ previous].
	^ previous findPreviousTag: anObject