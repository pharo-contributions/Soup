printing
printOn: aStream
	aStream 
		nextPutAll: '<![CDATA[';
		nextPutAll: contents;
		nextPutAll: ']]>'