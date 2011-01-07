finding strings
testFindAllStrings
	"self run: #testFindAllStrings"
	"Returns all the strings equal to the argument. Note that the argument can be a regex to match several elements." 
	
	| soup |
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	self assert: ((soup findAllStrings: 'abcd') size = 1).
	self assert: ((soup findAllStrings: 'abc' asRegex) size = 3).

