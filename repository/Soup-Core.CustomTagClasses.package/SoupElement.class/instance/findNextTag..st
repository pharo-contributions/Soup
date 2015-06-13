finding tags
findNextTag: anObject
	"Return the next tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	next ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(next isTag and: [findBlock value: next]) ifTrue: [^ next].
	^ next findNextTag: anObject