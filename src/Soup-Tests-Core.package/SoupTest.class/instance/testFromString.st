tests-instance creation
testFromString

	| soup |
	soup := Soup fromString: '<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>'.
	self assert: soup html head title text equals: 'Page title'.