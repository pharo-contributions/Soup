instance creation
named: aString parent: anElement previous: anotherElement
	^ (self parent: anElement previous: anotherElement)
		name: aString;
		yourself