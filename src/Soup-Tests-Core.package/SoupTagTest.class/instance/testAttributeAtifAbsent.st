accessing
testAttributeAtifAbsent
	| tag |
	tag := SoupTag new.
	tag attributeAt: 'abc' put: 'def'.
	tag attributeAt: 'abc' ifAbsent: [tag attributeAt: 'abc' put: 'asd'].
	tag attributeAt: 'xyz' ifAbsent: [tag attributeAt: 'xyz' put: 'asd'].
	self assert: ((tag attributeAt: 'abc') = 'def'). 
	self assert: ((tag attributeAt: 'xyz') = 'asd').