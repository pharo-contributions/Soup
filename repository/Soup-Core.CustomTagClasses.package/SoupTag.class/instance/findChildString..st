finding strings
findChildString: anObject
	"Returns the strings matching anObject in the direct children of the receiver. anObject can be a Boolean, a string, a regex or a collection of strings."

	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	self childStringsDo: [ :aString |
		(findBlock value: aString)  ifTrue: [^ aString]].
	^ nil