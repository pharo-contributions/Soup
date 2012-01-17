finding tags
testFindNextSiblingTag
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote>abc<blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingTag: true) id = '3'.
	self assert: (b findNextSiblingTag: [:e | e id = '4']) id = '4'.
	self assert: (b findNextSiblingTag: [:e | e id = '5']) = nil

