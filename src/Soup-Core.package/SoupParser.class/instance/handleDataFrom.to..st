handling
handleDataFrom: anInteger to: anotherInteger
	anInteger to: anotherInteger do: [
		:i |
		currentData nextPut: (string at: i)
		]
