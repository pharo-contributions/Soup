accessing
testSizeContainingSquareBrackets
	"The size of an element is its number of direct children"
	"self debug: #testSizeContainingSquareBrackets"
	| doc |
	doc := '[''<html><head><title>Page title</title></head> 
				<body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	(Soup fromString: doc ) size = 3.
	"The document is composed of [ ] and the <...>"