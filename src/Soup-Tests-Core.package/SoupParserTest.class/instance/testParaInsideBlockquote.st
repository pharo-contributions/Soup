tests
testParaInsideBlockquote
	| soup |
	soup := Soup fromString: '<blockquote><p><b>Foo</blockquote><p>Bar'.
	self assert: soup blockquote p b string = 'Foo'.
	self assert: soup blockquote b string = 'Foo'.
	self assert: (soup findChildTag: 'p') string = 'Bar'