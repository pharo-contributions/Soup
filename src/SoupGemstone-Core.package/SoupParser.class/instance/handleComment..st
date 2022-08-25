handling
handleComment: aString
	self endData.
	self handleData: aString.
	self endData: SoupComment

	
