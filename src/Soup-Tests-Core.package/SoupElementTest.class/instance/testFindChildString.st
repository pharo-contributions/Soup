finding tags
testFindChildString
	| soup b | 
	soup := Soup fromString: '<b id="1">def<b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'def'.
	self assert: ((b findChildString: 'abc') = nil).