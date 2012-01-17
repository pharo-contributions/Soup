finding strings
testFindChildString
	| soup tag|
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	tag := soup p.
	self assert: ((tag findChildString: 'abc') contents = 'abc').
	self assert: ((tag findChildString: 'abcxyz') contents = 'abcxyz').
	self assert: ((tag findChildString: 'ab') = nil).