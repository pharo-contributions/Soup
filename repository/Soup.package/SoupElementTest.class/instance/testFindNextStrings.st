finding tags
testFindNextStrings
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findTag: [:e | e name = 'b' and: [e id = '2']].
	self assert: (b findNextStrings: true) size = 2.

