as yet unclassified
possibleEncodings
	| possibleEncodings |
	possibleEncodings := {
		encoding.
		metaEncoding.
		xmlEncoding.
		sniffedXmlEncoding.
	} asOrderedCollection reject: [:eachString | eachString isNil].
	(possibleEncodings includes: 'utf-8') 
		ifFalse: [possibleEncodings add: 'utf-8'].
	(possibleEncodings includes: 'windows-1252') 
		ifFalse: [possibleEncodings add: 'windows-1252'].
	^ possibleEncodings
	