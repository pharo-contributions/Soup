finding tags
includesTag: aTag
	self childTagsDo: [ :tag|
		tag = aTag
			ifTrue: [ ^ true ].
		(tag includesTag: aTag)
			ifTrue: [ ^ true ]].
	^ false