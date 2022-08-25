convert
xmlForSmartQuote: aString
	^ xmlForSmartQuotes at: (aString at: 1) asInteger
