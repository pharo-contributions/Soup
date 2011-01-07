conversion
nextFromStream: aStream
	| character |
	character := aStream basicNext.
	character charCode > 127 
		ifTrue: [self error: 'Invalid ASCII character ' , character asString].
	^ character
