accessing
testAccessingText
	"The method text returns all the texts elements contained"
	"self debug: #testAccessingText"

	| doc |
	doc := '[''<html><head><title>Page title</title></head> <body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	self assert: (Soup fromString: doc ) text = '[''Page title This is paragraph oneThis is paragraph two]' 