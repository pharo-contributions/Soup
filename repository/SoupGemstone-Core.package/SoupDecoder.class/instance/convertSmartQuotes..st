convert
convertSmartQuotes: aString
	^ ('[{1}-{2}]' format: (#(128 159) collect: [:i | i asCharacter])) asRegex
		copy: aString
		translatingMatchesUsing: [
			:smartQuote |
			self convertSmartQuote: smartQuote
		]
