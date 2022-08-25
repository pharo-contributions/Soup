finding strings
testFindString
	| soup tag |
	soup := Soup fromString: '<p>abc<span>def</span></p>'.
	tag := soup p.
	self assert: (tag findString: 'def') contents = 'def'.
	self assert: (tag findString: #('def')) contents = 'def'.
	self assert: (tag findString: 'def' asRegex) contents = 'def'.
