testing
testIsSelfClosing
	| tag |
	tag := SoupTag new.
	self assert: tag isSelfClosing not.
	tag beSelfClosing.
	self assert: tag isSelfClosing.
	