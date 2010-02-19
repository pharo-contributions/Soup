finding strings
testFindAllStrings
"self run: #testFindAllStrings"
	| soup |
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	self assert: ((soup findAllStrings: 'abcd') size = 1).
	self assert: ((soup findAllStrings: 'abc' asRegex) size = 3).

