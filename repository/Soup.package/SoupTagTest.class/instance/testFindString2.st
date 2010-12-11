finding strings
testFindString2
	"self debug: #testFindString2"
	| soup tag |
	soup := Soup fromString: '<p>abc<span>def</span></p><b>abcdef<span>defi</span><span>defi2</span></b>'.
	tag := soup p.
	self assert: (tag findString: 'def') contents = 'def'.
	self assert: (tag findString: #('def')) contents = 'def'.
	self assert: (tag findString: 'def' asRegex) contents = 'def'.
	tag := soup b.
	self assert: (tag findString: 'def') isNil.
		"I do not like that not finding return a nil"
	self assert: (tag findString: 'defi') contents = 'defi'.
	self assert: (tag findString: #('defi' 'defi2')) contents = 'defi'.
	"we get the first occurrence here defi"
	
	self assert: (tag findString: '.def' asRegex) contents = 'abcdef'.
	"We get now the first occurrence matching the regex"