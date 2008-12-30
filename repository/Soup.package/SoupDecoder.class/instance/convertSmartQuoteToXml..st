as yet unclassified
convertSmartQuoteToXml: aString
	^ '&#x{1};' format: {self xmlForSmartQuote: aString}
