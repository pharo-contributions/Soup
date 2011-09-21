as yet unclassified
@ attributeName
	^ Array streamContents: [ :stream|
		self do: [ :tag|
			(tag @ attributeName) ifNotNilDo: [ :value| stream nextPut: value ]]]