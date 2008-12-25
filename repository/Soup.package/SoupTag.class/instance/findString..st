finding strings
findString: anObject
	| block |
	block := self createFindStringBlock: anObject.
	self childrenDo: [
		:eachElement |
		eachElement isString
			ifTrue: [(block value: eachElement) ifTrue: [^ eachElement]]
			ifFalse: [
				| found |
				found := eachElement findString: block.
				found ifNotNil: [^ found]
			]
	].
	^ nil
		