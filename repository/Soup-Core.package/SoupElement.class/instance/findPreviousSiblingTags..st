finding tags
findPreviousSiblingTags: anObject 
	"Return the previous sibling tags matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream | 
			self findPreviousSiblingTags: findBlock stream: aStream ]