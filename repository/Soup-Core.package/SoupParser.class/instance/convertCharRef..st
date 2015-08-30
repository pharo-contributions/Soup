converting
convertCharRef: aString
	| codePoint |
	[
		codePoint := (aString beginsWith: 'x')
			ifTrue: [Number readFrom: (aString allButFirst: 1) asUppercase base: 16]
			ifFalse: [Integer readFrom: aString readStream].
	] on: Error do: [
		^ nil
	].
	^ self convertCodePoint: codePoint
