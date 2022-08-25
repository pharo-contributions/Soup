convert
decodeFrom: encodingName
	| converter |
	converter := self encoderClass newForEncoding: encodingName.
	converter ifNil: [self error: 'No text converter for ' , encodingName].
	(self shouldConvertSmartQuotes: encodingName) 
		ifTrue: [xmlData := self convertSmartQuotes: xmlData].
	^ [converter decodeBytes: xmlData asByteArray]
		on: Error
		do: [:e | nil]