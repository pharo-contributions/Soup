accessing
testAddChild
	| tag childOne childTwo |
	tag := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	tag addChild: childOne.
	self assert: (tag childAt: 1) = childOne.
	tag addChild: childTwo.
	self assert: (tag childAt: 1) = childOne.
	self assert: (tag childAt: 2) = childTwo.
	self should: [tag childAt: 3] raise: Error.
	