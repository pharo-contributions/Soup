accessing
testString
	| soup |
	soup := Soup fromString: '<b>foo</b>'.
	self assert: (soup b string = 'foo').
	soup := Soup fromString: '<b>f<i>e</i>o</b>'.
	self assert: (soup b string) isNil