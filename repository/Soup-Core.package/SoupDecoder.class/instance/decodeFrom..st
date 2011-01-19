convert
decodeFrom: encodingName
	| converter |
	converter := TextConverter newForEncoding: encodingName.
	converter ifNil: [self error: 'No text converter for ' , encodingName].
	(self shouldConvertSmartQuotes: encodingName) 
		ifTrue: [xmlData := self convertSmartQuotes: xmlData].
	^ [xmlData convertFromWithConverter: converter]
		on: Error
		do: [:e | nil]