printing
printOn: aStream
	self childrenDo: [
		:eachElement |
		eachElement printOn: aStream.
	].
