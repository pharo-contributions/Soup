finding tags
findPreviousTags: anObject 
	"Return the next tags matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findPreviousTags: findBlock stream: aStream ]