documentation
accessingSize
	<systemHelp>
	| doc |
	doc := '[''<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	(Soup fromString: doc ) size.
	"size is 3 since the Soup is composed of [, ], and <...>"
	
	doc := '<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>'.
	(Soup fromString: doc ) size.
	"size is 1 because there is only the Soup has only one node."
	
	doc := '<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>'.
	(Soup fromString: doc ) html size. 
	"size is 2 because there is only the Soup has only one node."

	