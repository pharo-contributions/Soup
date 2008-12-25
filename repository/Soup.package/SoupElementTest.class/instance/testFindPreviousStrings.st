finding tags
testFindPreviousStrings
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">def<br/>abc<hr/></b><b id="3"><b id="4">'.
	b := soup findTag: 'hr'.
	self assert: (b findPreviousStrings: true) size = 2.

