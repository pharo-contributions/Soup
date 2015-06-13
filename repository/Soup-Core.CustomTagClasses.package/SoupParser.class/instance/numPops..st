handling
numPops: aString
	(tagStack size to: 2 by: -1) do: [
		:i |
		((tagStack at: i) name = aString) 
			ifTrue: [^ tagStack size - i + 1]
	].
	^ 0