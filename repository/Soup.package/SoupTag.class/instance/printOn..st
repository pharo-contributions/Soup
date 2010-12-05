printing
printOn: aStream
	aStream 
		nextPut: $<;
		nextPutAll: name.
	attributes keysAndValuesDo: 
		[ :key :value |
		aStream 
			nextPut: $ ;
			nextPutAll: key;
			nextPutAll: '='.
		self printAttributeValue: value on: aStream.].
	isSelfClosing 
		ifTrue: [aStream nextPutAll: ' />']
		ifFalse: [
			aStream nextPut: $>.
			children do: 
				[ :eachElement |
				eachElement printOn: aStream].
			aStream 
				nextPutAll: '</';
				nextPutAll: name;
				nextPut: $> ]