as yet unclassified
testJunkInDeclaration
	self 
		assertSoupFrom: '<! Foo = -8>a'
		printsAs: '<!Foo = -8>a'