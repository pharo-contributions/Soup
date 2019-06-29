"
Utility class for decoding
"
Class {
	#name : #SoupDecoder,
	#superclass : #Object,
	#instVars : [
		'string',
		'encoding',
		'metaEncoding',
		'xmlEncoding',
		'sniffedXmlEncoding',
		'shouldConvertSmartQuotes',
		'convertSmartQuotesTo',
		'xmlForSmartQuotes',
		'htmlForSmartQuotes',
		'xmlData'
	],
	#category : #'Soup-Core-Parser'
}

{ #category : #convert }
SoupDecoder >> convertSmartQuote: aString [
	^ convertSmartQuotesTo = #xml
		ifTrue: [self convertSmartQuoteToXml: aString]
		ifFalse: [self convertSmartQuoteToHtml: aString]

]

{ #category : #convert }
SoupDecoder >> convertSmartQuoteToHtml: aString [
	^ '&{1};' format: {self htmlForSmartQuote: aString}

]

{ #category : #convert }
SoupDecoder >> convertSmartQuoteToXml: aString [
	^ '&#x{1};' format: {self xmlForSmartQuote: aString}

]

{ #category : #convert }
SoupDecoder >> convertSmartQuotes: aString [
	^ ('[{1}-{2}]' format: (#(128 159) collect: [:i | i asCharacter])) asRegex
		copy: aString
		translatingMatchesUsing: [
			:smartQuote |
			self convertSmartQuote: smartQuote
		]

]

{ #category : #convert }
SoupDecoder >> convertSmartQuotesToHtml [
	convertSmartQuotesTo := #html

]

{ #category : #convert }
SoupDecoder >> convertSmartQuotesToXml [
	convertSmartQuotesTo := #xml

]

{ #category : #convert }
SoupDecoder >> decode [

	self possibleEncodings
		do: [ :eachString |
				| decodedString |
				decodedString := self decodeFrom: eachString.
				decodedString ifNotNil: [^ decodedString]].
	^ string
]

{ #category : #convert }
SoupDecoder >> decodeFrom: encodingName [
	| converter |
	converter := TextConverter newForEncoding: encodingName.
	converter ifNil: [self error: 'No text converter for ' , encodingName].
	(self shouldConvertSmartQuotes: encodingName) 
		ifTrue: [xmlData := self convertSmartQuotes: xmlData].
	^ [xmlData convertFromWithConverter: converter]
		on: Error
		do: [:e | nil]
]

{ #category : #convert }
SoupDecoder >> decodePythonString: aString [
	^ String streamContents: [
		:aStream |
		(aString findTokens: '\x') do: [
			:eachString | 
			aStream nextPut: (Number 
				readFrom: eachString asUppercase 
				base: 16) asCharacter
		]
	]
	
]

{ #category : #accessing }
SoupDecoder >> detectEncoding [
	xmlData := string.
	[self sniffNonAsciiCompatibleEncoding.
	self sniffEncoding]
		on: Error do: [:e | ]
			
]

{ #category : #convert }
SoupDecoder >> encodeAsUtf8: aString [

]

{ #category : #convert }
SoupDecoder >> htmlForSmartQuote: aString [
	^ htmlForSmartQuotes at: (aString at: 1) asInteger

]

{ #category : #initialize }
SoupDecoder >> initialize [
	super initialize.
	self initializeXmlForSmartQuotes.
	self initializeHtmlForSmartQuotes.
	self convertSmartQuotesToXml.
	shouldConvertSmartQuotes := true
]

{ #category : #initialize }
SoupDecoder >> initializeHtmlForSmartQuotes [
	htmlForSmartQuotes := Dictionary newFrom: {
		128 -> 'euro'.
		129 -> ' '.
		130 -> 'sbquo'.
		131 -> 'fnof'.
		132 -> 'bdquo'.
		133 -> 'hellip'.
		134 -> 'dagger'.
		135 -> 'Dagger'.
		136 -> 'circ'.
		137 -> 'permil'.
		138 -> 'Scaron'.
		139 -> 'lsaquo'.
		140 -> 'OElig'.
		141 -> ' '.
		142 -> '#x17D'.
		143 -> ' '.
		144 -> ' '.
		145 -> 'lsquo'.
		146 -> 'rsquo'.
		147 -> 'ldquo'.
		148 -> 'rdquo'.
		149 -> 'bull'.
		150 -> 'ndash'.
		151 -> 'mdash'.
		152 -> 'tilde'.
		153 -> 'trade'.
		154 -> 'scaron'.
		155 -> 'rsaquo'.
		156 -> 'oelig'.
		157 -> ' '.
		158 -> '#x17E'.
		159 -> 'Yuml'.
	}.

]

{ #category : #initialize }
SoupDecoder >> initializeXmlForSmartQuotes [
	xmlForSmartQuotes := Dictionary newFrom: {
		128 -> '20AC'.
		129 -> ' '.
		130 -> '201A'.
		131 -> '192'.
		132 -> '201E'.
		133 -> '2026'.
		134 -> '2020'.
		135 -> '2021'.
		136 -> '2C6'.
		137 -> '2030'.
		138 -> '160'.
		139 -> '2039'.
		140 -> '152'.
		141 -> ' '.
		142 -> '17D'.
		143 -> ' '.
		144 -> ' '.
		145 -> '2018'.
		146 -> '2019'.
		147 -> '201C'.
		148 -> '201D'.
		149 -> '2022'.
		150 -> '2013'.
		151 -> '2014'.
		152 -> '2DC'.
		153 -> '2122'.
		154 -> '161'.
		155 -> '203A'.
		156 -> '153'.
		157 -> ' '.
		158 -> '17E'.
		159 -> ''.
	}.

]

{ #category : #convert }
SoupDecoder >> possibleEncodings [
	| possibleEncodings |
	possibleEncodings := {
		encoding.
		metaEncoding.
		xmlEncoding.
		sniffedXmlEncoding.
	} asOrderedCollection reject: [:eachString | eachString isNil].
	(possibleEncodings includes: 'utf-8') 
		ifFalse: [possibleEncodings add: 'utf-8'].
	(possibleEncodings includes: 'cp-1252') 
		ifFalse: [possibleEncodings add: 'cp-1252'].
	^ possibleEncodings
	
]

{ #category : #convert }
SoupDecoder >> reset [
	xmlEncoding := nil.
	sniffedXmlEncoding := nil.
	string := nil.
	xmlData := nil.
	
]

{ #category : #convert }
SoupDecoder >> shouldConvertSmartQuotes: aString [
	^ shouldConvertSmartQuotes and: [
		#(
			'cp-1252'
			'iso-8859-1'
			'iso-8859-2'
			'latin1'
		) includes: aString
	]

]

{ #category : #accessing }
SoupDecoder >> sniffEncoding [
	| xmlEncodingMatcher |
	xmlEncodingMatcher := '^<\?.*encoding=[''"](.*?)[''"].*\?>' asRegex.
	(xmlEncodingMatcher matches: xmlData)
		ifTrue: [
  			xmlEncoding = (xmlEncodingMatcher subexpression: 1) asLowercase.
			(sniffedXmlEncoding notNil and: [
				#('iso-10646-ucs-2' 'ucs-2' 'csunicode'
				'iso-10646-ucs-4' 'ucs-4' 'csucs4'
				'utf-16' 'utf-32' 'utf_16' 'utf_32'
				'utf16' 'u16') includes: xmlEncoding
		]) ifTrue: [xmlEncoding := sniffedXmlEncoding]
	].

]

{ #category : #accessing }
SoupDecoder >> sniffNonAsciiCompatibleEncoding [

	(self stringStartsWith: '\x4c\x6f\xa7\x94')
		ifTrue: [
	  		sniffedXmlEncoding := nil.
			^ xmlData := self convertEbcdicToAscii: string.
		].
	(self stringStartsWith: '\x00\x3c\x00\x3f')
		ifTrue: [
			sniffedXmlEncoding := 'utf-16be'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	((string size >= 4) 
		and: [(self stringStartsWith: '\xfe\xff') 
			and: [(self stringStartsWith: '\xfe\xff\x00\x00') not]])
		ifTrue: [
			sniffedXmlEncoding := 'utf-16be'.
			^ xmlData := ((string copyFrom: 3 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x3c\x00\x3f\x00')
		ifTrue: [
			sniffedXmlEncoding := 'utf-16le'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	((string size >= 4) 
		and: [(self stringStartsWith: '\xff\xfe') 
			and: [(self stringStartsWith: '\xff\xfe\x00\x00') not]])
		ifTrue: [
			sniffedXmlEncoding := 'utf-16le'.
			^ xmlData := ((string copyFrom: 3 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x00\x00\x00\x3c')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32be'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x3c\x00\x00\x00')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32le'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x00\x00\xfe\xff')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32be'.
			^ xmlData := ((string copyFrom: 5 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\xff\xfe\x00\x00')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32le'.
			^ xmlData := ((string copyFrom: 5 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\xef\xbb\xbf')
		ifTrue: [
			sniffedXmlEncoding := 'utf-8'.
			^ xmlData := ((string copyFrom: 4 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	sniffedXmlEncoding := 'latin1'

]

{ #category : #accessing }
SoupDecoder >> string: anObject [
	self reset.
	string := anObject.
	self detectEncoding.
]

{ #category : #accessing }
SoupDecoder >> stringStartsWith: aString [
	^ string beginsWith: (self decodePythonString: aString)

]

{ #category : #convert }
SoupDecoder >> xmlForSmartQuote: aString [
	^ xmlForSmartQuotes at: (aString at: 1) asInteger

]
