finding tags
testFindNextSiblingTags
	"self debug: #testFindNextSiblingTags"
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingTags: true) size = 2.
	"Two because we get the node 3 (with the subnode 3.1 and the node 4"
	self assert: (b findNextSiblingTags: [:e | e id = '4']) size = 1.
	