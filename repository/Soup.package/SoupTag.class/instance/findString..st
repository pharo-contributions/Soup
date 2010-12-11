finding strings
findString: anObject
	"Find the first occurrence of a String satisfying the argument. The argument can e a Boolean, a String, a Regex or a collection of strings"
	| block |
	block := self createFindStringBlock: anObject.
	self childrenDo: [ :eachElement |
		eachElement isString
			ifTrue: [(block value: eachElement) ifTrue: [^ eachElement]]
			ifFalse: [
				| found |
				found := eachElement findString: block.
				found ifNotNil: [^ found]
			]
	].
	^ nil
		