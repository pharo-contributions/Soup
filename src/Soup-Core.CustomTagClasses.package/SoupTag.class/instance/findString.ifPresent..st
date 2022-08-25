finding strings
findString: anObject ifPresent: aBlock
	"Execute aBlock, if a string satisfying anObject is found. anObject can be a Boolean, a string, a regex or a collection of strings."
	| found |
	found := self findString: anObject.
	^ found ifNotNil: [aBlock value: found]