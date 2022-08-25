accessing
text
	"Return a string containing the concatenation of the texts in the receiver. For an example, have a look at (SoupDocumentation>>#accessingText)"

	^ String streamContents: 
			[ :aStream |
				children do: [ :eachElement | 
							aStream nextPutAll: eachElement text ] ]