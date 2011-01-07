accessing
testName
	| tag |
	tag := SoupTag new.
	tag name: 'abc'.
	self assert: tag name = 'abc'