parsing
equals: aString from: anInteger
	(anInteger > string size) ifTrue: [^ false].
	(anInteger + aString size > string size) ifTrue: [^ false].
	aString withIndexDo: [
		:eachChar :eachInteger |
		(string at: (eachInteger + anInteger)) = eachChar
			ifFalse: [^ false]
	].
	^ true