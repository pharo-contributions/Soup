handling
handleStartTagFrom: anInteger to: anotherInteger tag: aString attrs: aDictionary
	| tag |
	quoteStack isEmpty ifFalse: [^ self handleDataFrom: anInteger + 1 to: anotherInteger].
	self endData.
	(self isSelfClosingTag: aString) ifFalse: [self smartPop: aString].
	tag := SoupTag named: aString parent: tagStack last previous: previous.
	aDictionary keysAndValuesDo: [
		:key :value |
		tag attributeAt: key put: value
	].
	previous := tag.
	self pushTag: tag.
	(self isSelfClosingTag: aString) ifTrue: [
		tag beSelfClosing.
		self popTag
	].
	(parameters quoteTags includes: aString) 
		ifTrue: [
			quoteStack addLast: aString.
			literal := true
		].
	^ tag
	

	