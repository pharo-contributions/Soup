tests
testEntityReplacement
	self assertSoupFrom: '<b>hello&nbsp;there</b>' printsAs: '<b>hello&nbsp;there</b>'