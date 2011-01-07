Introduction 
------------------

Soup is a HTML/XML parser designed for quick turnaround projects like screen-scraping. Three features make it powerful:
 Soup won't choke if you give it bad markup. It yields a parse tree that makes approximately as much sense as your original document. This is usually good enough to collect the data you need and run away.
 Soup provides a few simple methods and idioms for navigating, searching, and modifying a parse tree: a toolkit for dissecting a document and extracting what you need. You don''t have to create a custom parser for each application.
 Soup automatically converts incoming documents to Unicode and outgoing documents to UTF-8. You don't have to think about encodings, unless the document doesn't specify an encoding and  Soup can't autodetect one. Then you just have to specify the original encoding.
 Soup parses anything you give it, and does the tree traversal stuff for you.

Main Classes
The main classes from a user perspective is Soup. This is by interacting with it that you will get a soup of html entities. This is also Soup which invokes the parser.

The best way to get started is to get a soup of html elements using fromString: as follows:

	Soup fromString: 'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream

API
----
The api supports the query of elements of the soup satisfying various conditions. In general, it can be a Boolean, a string, a regex or a collection of Strings. 

	- findAllStrings: all the strings satisfying one condition
	- findString: returns the first node 
	- findNextTag: returns the next node
	- findNextTags: returns the 
	- findNextSiblingTag: to navigate at the same level
	
	
Accessing Text
----------------------

	You should use the method fromString: to a Soup representation of your HTML page.
	For example
	
	| doc |
	doc := '[''<html><head><title>Page title</title></head> <body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	(Soup fromString: doc ) text 

	then asking for the texts elements you get the text of the HTML. The previous snippet produces the following results."
	
	'[''Page title This is paragraph one
	This is paragraph two
	]'

































Implementation Notes

 I'm not the original implementors of this cool package, but I'm just responsible about a better documentation and set of tests. Now it is not clear whether returning nil when no elements are found should not be changed to avoid isNil plague. 
	for example in 
		findStrings:
		string
	Stéphane Ducasse 
	

