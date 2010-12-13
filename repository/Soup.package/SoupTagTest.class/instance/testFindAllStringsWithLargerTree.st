finding strings
testFindAllStringsWithLargerTree
	"self run: #testFindAllStringsWithLargerTree"
	"Returns all the strings equal to the argument. Note that the argument can be a regex to match several elements." 
	
	| soup |
	soup := Soup fromString: '<p>abc<span>def</span></p><b>abcdef<span>defi</span><span>defi2</span></b><p>abc3<span>def</span></p>'.
	self assert: ((soup findAllStrings: 'abcdef' asRegex) size = 1).
	self assert: ((soup findAllStrings: 'abc3') size = 1).
	self assert: ((soup findAllStrings: 'abc' asRegex) size = 3).

