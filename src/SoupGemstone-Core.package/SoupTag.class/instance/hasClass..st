accessing
hasClass: aString
	
	^ (self attributeAt: 'class')
		ifNil: [ false ]
		ifNotNilDo: [ :classAttribute|
			(Character space split: classAttribute) includes: aString ]