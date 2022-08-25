convert
shouldConvertSmartQuotes: aString
	^ shouldConvertSmartQuotes and: [
		#(
			'cp-1252'
			'iso-8859-1'
			'iso-8859-2'
			'latin1'
		) includes: aString
	]
