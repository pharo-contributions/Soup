accessing
testString
	"self debug: #testString"
	| soup |
	soup := Soup fromString: '<b>foo</b>'.
	self assert: (soup b string = 'foo').
	
	"if the element is composed of subnodes return nil"
	soup := Soup fromString: '<b>f<i>e</i>o</b>'.
	self assert: (soup b string) isNil.
	
	soup := Soup fromString: '<b>foo</b><b>bar</b>'.
	self assert: (soup b string = 'foo').
	self assert: (soup b nextSibling string = 'bar').
	