finding strings
testFindPreviousSiblingStrings
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote>abc<br/>def<blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousSiblingStrings: true) size = 2.

