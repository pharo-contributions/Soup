initialize
initialize
	super initialize.
	self initializeXmlForSmartQuotes.
	self initializeHtmlForSmartQuotes.
	self convertSmartQuotesToXml.
	shouldConvertSmartQuotes := true