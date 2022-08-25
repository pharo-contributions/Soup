accessing
testSize
	"The size of an element is its number of direct children"
	"self debug: #testSize"
	| soup doc|
	soup := Soup fromString: '<top>1<b>2</b>3</top><hr/>'.
	self assert: (soup size = 2).
	
	doc := '<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>'.
	soup := Soup fromString: doc.
	self assert: soup size = 1.
	"<html> ....</html> is one node"
	self assert: soup html size = 2.
	"inside we get <head> and <body>..."
	