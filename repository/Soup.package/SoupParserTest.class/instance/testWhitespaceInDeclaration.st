as yet unclassified
testWhitespaceInDeclaration
	self 
		assertSoupFrom: '<! DOCTYPE>'
		printsAs: '<!DOCTYPE>'