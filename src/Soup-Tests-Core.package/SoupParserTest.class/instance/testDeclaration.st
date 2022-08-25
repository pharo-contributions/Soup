tests
testDeclaration
	| xml |
	xml := 'foo<!DOCTYPE foobar>baz'.
	self assertSoupFrom: xml printsAs: xml.
	