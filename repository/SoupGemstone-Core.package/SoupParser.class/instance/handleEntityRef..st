handling
handleEntityRef: aString
	^ self handleData: (String streamContents: [
		:aStream |
		aStream 
			nextPut: $&;
			nextPutAll: aString;
			nextPut: $;])