testing
testIsTag
	| tag |
	tag := SoupTag new.
	self assert: tag isTag.
	