tests
testSelfClosingTag
	self assert: ((Soup fromString: 'Foo<br/>Bar') findTag: 'br') printString = '<br />'.
	self assert: (Soup fromString: '<p>test1<br/>test2</p>') printString = (Soup fromString: '<p>test1<br />test2</p>') printString.
	self assert: (Soup fromString: '<p>test1<selfclosing>test2') printString = '<p>test1<selfclosing>test2</selfclosing></p>'.
	