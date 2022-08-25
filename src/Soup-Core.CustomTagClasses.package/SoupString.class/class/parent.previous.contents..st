instance creation
parent: anElement previous: anotherElement contents: aString
	^ (super parent: anElement previous: anotherElement)
		contents: aString;
		yourself