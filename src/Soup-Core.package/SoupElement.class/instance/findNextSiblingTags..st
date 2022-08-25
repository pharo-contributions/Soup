finding tags
findNextSiblingTags: anObject 
	"Return the next sibling tags matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findNextSiblingTags: findBlock stream: aStream ]