SoupParser is a parser that creates Soup trees out of HTML. Soup Elements are not fine grained structure representing detailed HTML elements like a 

Here is an example of how to use it: 

	Soup fromString: 'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream

You can also invoke it using: 
	(SoupParser parameters: Soup defaultParserParameters) 
		parseString:  'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream