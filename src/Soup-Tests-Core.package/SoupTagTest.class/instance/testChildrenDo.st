enumerating
testChildrenDo
	| tag childOne childTwo |
	tag := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	tag addChild: childOne.
	tag addChild: childTwo.
	tag childrenDo: [ :anElement |
		self assert: ({childOne. childTwo} includes: anElement) ].