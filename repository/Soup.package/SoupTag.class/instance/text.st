accessing
text
	^ String streamContents: [
		:aStream |
		children do: [
			:eachElement | 
			aStream nextPutAll: eachElement text
		]
	]