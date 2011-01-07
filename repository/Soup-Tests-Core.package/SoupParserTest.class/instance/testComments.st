tests
testComments
	| soup xml |
	xml := 'foo<!--foobar-->baz'.
	soup := Soup fromString: xml.
	self assert: soup printString = xml.
	self assert: (soup findString: 'foobar') isComment
	