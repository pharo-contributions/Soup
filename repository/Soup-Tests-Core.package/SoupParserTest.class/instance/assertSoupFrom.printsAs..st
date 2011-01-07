tests
assertSoupFrom: aString printsAs: anotherString
	| soup |
	soup := Soup fromString: aString.
	self assert: soup printString = anotherString