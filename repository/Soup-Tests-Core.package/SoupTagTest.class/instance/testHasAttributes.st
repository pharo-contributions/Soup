error handling
testHasAttributes
	| soup body span|
	soup := Soup fromString: '<body id="a"><p id="b">a<span>b</span><br/>'.
	body := soup findTag: 'body'.
	span := soup findTag: 'span'.
	self assert: (body hasAttributes).
	self assert: (span hasAttributes = false).