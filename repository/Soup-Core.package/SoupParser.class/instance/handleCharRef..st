handling
handleCharRef: aString
	^ self handleData: (String streamContents: [
		:aStream |
		aStream 
			nextPut: $&;
			nextPut: $#;
			nextPutAll: aString;
			nextPut: $;])