tests
testWhitespaceInDeclaration
	self 
		assertSoupFrom: '<! DOCTYPE>'
		printsAs: '<!DOCTYPE>'