Soup is the main public class of the package. It is the class to interact with as shown by the tests.

The best way to get started is to get a soup of html elements using fromString: as follows:

	Soup fromString: 'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream


