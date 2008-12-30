as yet unclassified
nextPut: aCharacter toStream: aStream
	aStream isBinary ifTrue: [^ aCharacter storeBinaryOn: aStream].
	aCharacter charCode < 128 
		ifTrue: [aStream basicNextPut: aCharacter] 
		ifFalse: [aStream basicNextPut: ((Character value: (self fromSqueak: aCharacter) charCode))].
