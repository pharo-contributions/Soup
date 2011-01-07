finding tags
testFindNextSiblingVersusFindTags
	"self debug: #testFindNextSiblingVersusFindTags"
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingTags: [:e | '3*' match: e id]) size = 1.
	"here we see the difference between siblings and not. There are two nodes
	matching the id 3. 3 and 3.1 but they are not on the same level."
	self assert: (b findNextTags: [:e | '3*' match: e id]) size = 2.