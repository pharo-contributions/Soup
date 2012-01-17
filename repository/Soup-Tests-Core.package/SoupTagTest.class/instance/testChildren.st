finding strings
testChildren
	| soup tag|
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	tag := soup p.
	self assert: (tag children first contents = 'abcxyz').
	self assert: (tag children second = soup span).