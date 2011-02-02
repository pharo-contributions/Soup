A ConfigurationOfSoup is a work under way.

It should express that it depends on XMLSupport.

Gofer new
	squeaksource: 'XMLSupport'; 
	version: 'ConfigurationOfXMLSupport-JAAyer.43';
	load.
	
(Smalltalk at: #ConfigurationOfXMLSupport) perform: #loadDefault.

(Smalltalk at: #ConfigurationOfSoup) perform: #loadDefault.
