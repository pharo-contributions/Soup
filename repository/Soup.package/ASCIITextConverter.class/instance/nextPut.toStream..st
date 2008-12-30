conversion
nextPut: aCharacter toStream: aStream 
	aCharacter charCode > 127 
		ifTrue: [self error: 'Invalid ASCII character ' , aCharacter asString].
	aStream basicNextPut: (Character value: aCharacter charCode).
