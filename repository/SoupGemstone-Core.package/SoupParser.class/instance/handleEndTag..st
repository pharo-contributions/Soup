handling
handleEndTag: aString
	(quoteStack isEmpty not and: [quoteStack last ~= aString])
		ifTrue: [^ self handleData: (String streamContents: [
			:stream | 
				stream nextPutAll: '</'; nextPutAll: aString; nextPutAll: '>'
			])].
	self endData.
	self popToTag: aString.
	(quoteStack isEmpty not and: [quoteStack last = aString])
		ifTrue: [
			quoteStack removeLast.
			literal := quoteStack isEmpty not
		]
