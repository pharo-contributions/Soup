as yet unclassified
shouldConvertSmartQuotes: aString
	^ shouldConvertSmartQuotes and: [
		#(
			'windows-1252'
			'iso-8859-1'
			'iso-8859-2'
		) includes: aString
	]
