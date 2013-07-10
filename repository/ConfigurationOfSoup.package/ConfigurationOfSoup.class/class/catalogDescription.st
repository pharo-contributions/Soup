catalog
catalogDescription

	^ '!! Soup 
		Soup is a frameworks for scrapping HTML. It offers a simplified query mechanism to abstract over the XML and HTML structure of a document. 
		
		It is composed of some keys classes: 
		
		- SoupElement is the root of elements that are extracted during the parsing of an HTML document. Contrary to traditional HTML Parser, Soup produces a limited set of elements which approximate the HTML elements but supports querying and extracting information. 
		
		- Soup 
		Soup is the main public class of the package. It is the class to interact with as shown by the tests.

The best way to get started is to get a soup of html elements using ==Soup class >> fromString: == as follows:

[ [ [ 
	Soup fromString: ''http://www.bedetheque.com/album-105582-BD-Atomium-Express.html'' asUrl retrieveContents contentStream
]]]

'