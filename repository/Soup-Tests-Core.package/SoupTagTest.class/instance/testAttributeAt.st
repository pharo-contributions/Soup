accessing
testAttributeAt
	| tag |
	tag := SoupTag new.
	tag attributeAt: 'abc' put: 'def'.
	self assert: (tag attributeAt: 'abc') = 'def'.
	self should: (tag attributeAt: 'xyz') = nil