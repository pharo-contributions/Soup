accessing
testBeParentOf
	| parent childOne childTwo |
	parent := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	parent beParentOf: childOne.
	parent beParentOf: childTwo.
	self assert: childOne nextSibling = childTwo.
	self assert: childTwo previousSibling = childOne.
	parent childrenDo: [ :anElement |
		self assert: ({childOne. childTwo.} includes: anElement) ].