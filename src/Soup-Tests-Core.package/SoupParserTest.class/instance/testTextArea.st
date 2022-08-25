tests
testTextArea
	| soup |
	soup := Soup fromString: '<textarea><b>This is an example of an HTML tag</b><&<&</textarea>'.
	self assert: soup textarea string = '<b>This is an example of an HTML tag</b><&<&'