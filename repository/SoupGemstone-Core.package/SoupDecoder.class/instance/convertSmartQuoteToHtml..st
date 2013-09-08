convert
convertSmartQuoteToHtml: aString
	^ '&{1};' format: {self htmlForSmartQuote: aString}
