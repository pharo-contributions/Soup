handling
handleEndTagFrom: anInteger to: anotherInteger tag: aString
	(quoteStack isEmpty not and: [quoteStack last ~= aString])
		ifTrue: [^ self handleDataFrom: anInteger to: anotherInteger].
	self endData.
	self popToTag: aString.
	(quoteStack isEmpty not and: [quoteStack last = aString])
		ifTrue: [
			quoteStack removeLast.
			literal := quoteStack isEmpty not
		]
