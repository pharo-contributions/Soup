finding strings
testFindString2
	<publicTest>
	<systemHelp>
	
	| soup tag |
	"Now we build a soup element with two branches containing different strings."
	soup := Soup fromString: '<p>abc<span>def</span></p><b>abcdef<span>defi</span><span>defi2</span></b>'.
	
	"We are accessing the first nodes being a paragraph"
	tag := soup p.
	
	"Now we can check that the string 'def' is found either directly or among a list of elements to be found, or using a regex"
	self assert: (tag findString: 'def') contents = 'def'.
	self assert: (tag findString: #('def')) contents = 'def'.
	self assert: (tag findString: 'def' asRegex) contents = 'def'.
	
	"Now we progress and query the b element"
	tag := soup b.
	
	"This branch does not contain a 'def' string so it returns nil"
	self assert: (tag findString: 'def') isNil.
		"IMplementation note: returning nil is suboptimal"
	
	"still we can find other string elements using the same api than above"	
	self assert: (tag findString: 'defi') contents = 'defi'.
	self assert: (tag findString: #('defi' 'defi2')) contents = 'defi'.
	"we get the first occurrence here defi"
	
	"We get now the first occurrence matching the regex"
	self assert: (tag findString: '.def' asRegex) contents = 'abcdef'.
	