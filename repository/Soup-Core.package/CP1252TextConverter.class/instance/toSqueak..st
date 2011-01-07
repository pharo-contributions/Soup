as yet unclassified
toSqueak: aCharacter 
	| value |
	value := aCharacter charCode.
	(value >= 128 and: [value <= 159])
		ifTrue: [^ ToTable at: aCharacter charCode].
	^ aCharacter