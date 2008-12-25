finding tags
testFindNextString
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextString: true) contents = 'abc'.

	