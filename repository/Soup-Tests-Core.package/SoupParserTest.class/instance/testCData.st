tests
testCData
	| soup data |
	soup := Soup fromString: '<root>foo<![CDATA[foobar]]>bar</root>'.
	data := soup findString: 'foo.*bar' asRegex. 
	self assert: data contents = 'foobar'.
	self assert: data printString = '<![CDATA[foobar]]>'