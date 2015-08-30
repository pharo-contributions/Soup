convert
htmlForSmartQuote: aString
	^ htmlForSmartQuotes at: (aString at: 1) asInteger
