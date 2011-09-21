tests
testNamespaceNode
	| soup tag |
	soup := Soup fromString: '<issues:id>123</issues:id>'.
	tag := (soup findTag: 'issues:id').
	self assert: tag name = 'issues:id'.
	self assert: tag string = '123'.
	