tests
testIncompleteDeclaration
	" BeautifulSoup will parse this as 'a<!b <p>c'. It simply gives up after 
	failing to parse a doctype. I can't see the logic of this. Hence: "
	self assertSoupFrom: 'a<!b <p>c' printsAs: 'a<!b <p>c</p>'