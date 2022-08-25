finding tags
testFindPreviousSiblingTags
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousSiblingTags: true) size = 2.
	self assert: (b findPreviousSiblingTags: [:e | e id = '1']) size = 1.
