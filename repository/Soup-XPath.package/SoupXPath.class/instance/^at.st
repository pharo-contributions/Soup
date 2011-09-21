filtering
@ attributeName

	^ Array streamContents: [ :stream|
		self do: [ :tag|
			(tag @ attributeName) ifNotNilDo: [ :value| stream nextPut: value ]]]