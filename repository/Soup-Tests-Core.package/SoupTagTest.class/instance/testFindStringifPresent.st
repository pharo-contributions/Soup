finding strings
testFindStringifPresent
	| soup tag found|
	soup := Soup fromString: '<p>abc<span>def</span></p>'.
	tag := soup p.
	found := nil.
	tag findString: 'def' ifPresent: [:aString | found := aString].
	self assert: (found contents = 'def'). 
	self assert: (found isString).
	tag findString: 'def' asRegex ifPresent: [:aString | found := aString ].
	self assert: (found contents = 'def').
