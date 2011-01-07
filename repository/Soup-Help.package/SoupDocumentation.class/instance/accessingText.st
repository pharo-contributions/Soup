documentation
accessingText
	<systemHelp>
	
	| doc |
	"You should use the method fromString: to a Soup representation of your HTML page.
	For example"
	
	doc := '[''<html><head><title>Page title</title></head> <body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	(Soup fromString: doc ) text 

	"then asking for the texts elements you get the text of the HTML"
	"the previous snippet produces the following results."
	
	"'[''Page title This is paragraph one
	This is paragraph two
	]'"