documentation
accessingText

	| doc |
	doc := '[''<html><head><title>Page title</title></head> <body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	(Soup fromString: doc ) text 

	"'[''Page title This is paragraph one
	This is paragraph two
	]'"