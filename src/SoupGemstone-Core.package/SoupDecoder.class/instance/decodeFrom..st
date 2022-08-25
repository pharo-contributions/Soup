convert
decodeFrom: encodingName

	(self shouldConvertSmartQuotes: encodingName) 
		ifTrue: [xmlData := self convertSmartQuotes: xmlData].
	^xmlData