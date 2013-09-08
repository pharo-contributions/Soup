convert
convertSmartQuote: aString
	^ convertSmartQuotesTo = #xml
		ifTrue: [self convertSmartQuoteToXml: aString]
		ifFalse: [self convertSmartQuoteToHtml: aString]
