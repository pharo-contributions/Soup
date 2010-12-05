accessing
text
	"Returns a string containing the concatenation of the texts in the receiver"

	^ String streamContents: 
			[ :aStream |
				children do: [ :eachElement | 
							aStream nextPutAll: eachElement text ] ]