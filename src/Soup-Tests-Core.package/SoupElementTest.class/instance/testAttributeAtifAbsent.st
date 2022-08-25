finding tags
testAttributeAtifAbsent
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'abc'.
	b attributeAt: 'asd' ifAbsent: [b attributeAt: 'asd' put: 'def'].
	self assert: (b attributeAt: 'asd') = nil.

	