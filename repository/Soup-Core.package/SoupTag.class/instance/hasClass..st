accessing
hasClass: aString
	^ (self attributeAt: 'class')
		ifNil: [ false ]
		ifNotNil:
			[ :classAttribute | (Character space split: classAttribute) includes: aString ]