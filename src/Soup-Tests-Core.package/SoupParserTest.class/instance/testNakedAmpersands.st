tests
testNakedAmpersands
	| invalidUrl validUrl |
	invalidUrl := '<a href="http://example.org?a=1&b=2;3">foo</a>'.
	validUrl := invalidUrl copyReplaceAll: '&'  with: '&amp;'.
	self assertSoupFrom: invalidUrl printsAs: validUrl.
	self assertSoupFrom: validUrl printsAs: validUrl.
	
