A ConfigurationOfSoup is a work under way.

(ConfigurationOfSoup project version: #'stable') load

(ConfigurationOfSoup project version: '1.0') load

should load but I'm testing it.





This is the old way to load it.
-------------------------------------------
Gofer new
	squeaksource: 'XMLSupport'; 
	version: 'ConfigurationOfXMLSupport-JAAyer.43';
	load.
	
(ConfigurationOfXMLWriter project version: '0.2') load

(Smalltalk at: #ConfigurationOfSoup) project load:  #loadDefault.
