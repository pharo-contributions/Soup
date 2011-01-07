finding tags
testFindNextTags
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e name = 'b' and: [e id = '2']].
	self assert: (b findNextTags: 'b') size = 2.
	self assert: (b findNextTags: [:e | e name = 'b' and: [e id = '4']]) size = 1.
