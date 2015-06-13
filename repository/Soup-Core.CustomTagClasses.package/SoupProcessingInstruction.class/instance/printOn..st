printing
printOn: aStream
	aStream 
		nextPutAll: '<?';
		nextPutAll: contents;
		nextPutAll: '>'