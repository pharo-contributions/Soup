tests
testLiteralMode
	| soup |
	soup := Soup fromString: '<script>if (i<imgs.length)</script><b>Foo</b>'.
	self assert: soup script string = 'if (i<imgs.length)'.
	self assert: soup b string = 'Foo'.
	