finding tags
testFindPreviousTags
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e name = 'b' and: [e id = '3']].
	self assert: (b findPreviousTags: 'b') size = 2.
	self assert: (b findPreviousTags: [:e | e name = 'b' and: [e id = '1']]) size = 1.
