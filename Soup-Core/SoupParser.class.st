"
SoupParser is a parser that creates Soup trees out of HTML. Soup Elements are not fine grained structure representing detailed HTML elements like a 

Here is an example of how to use it: 

	Soup fromString: 'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream

You can also invoke it using: 
	(SoupParser parameters: Soup defaultParserParameters) 
		parseString:  'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream
"
Class {
	#name : #SoupParser,
	#superclass : #Object,
	#instVars : [
		'string',
		'currentData',
		'tagStack',
		'quoteStack',
		'interesting',
		'startTagOpen',
		'charRef',
		'entityRef',
		'endBracket',
		'tagFind',
		'attrFind',
		'entityOrCharRef',
		'previous',
		'literal',
		'parameters',
		'incomplete',
		'refFind'
	],
	#category : #'Soup-Core-Parser'
}

{ #category : #'instance creation' }
SoupParser class >> parameters: aParameters [
	^ self new 
		parameters: aParameters;
		yourself
	
]

{ #category : #converting }
SoupParser >> convertCharRef: aString [
	| codePoint |
	[
		codePoint := (aString beginsWith: 'x')
			ifTrue: [Number readFrom: (aString allButFirst: 1) asUppercase base: 16]
			ifFalse: [Integer readFrom: aString readStream].
	] on: Error do: [
		^ nil
	].
	^ self convertCodePoint: codePoint

]

{ #category : #converting }
SoupParser >> convertCodePoint: codePoint [
	^ codePoint asCharacter asString

]

{ #category : #converting }
SoupParser >> convertEntityRef: aString [
	^ parameters entityDefinitions at: aString ifAbsent: [nil]

]

{ #category : #converting }
SoupParser >> convertRef: aMatcher [
	(aMatcher subexpression: 3) 
		ifNotNil: [
			^ (self convertCharRef: (aMatcher subexpression: 3))
				ifNil: [aMatcher subexpression: 1]
		].
	(aMatcher subexpression: 4)
		ifNotNil: [
			^ (self convertEntityRef: (aMatcher subexpression: 4))
				ifNil: [aMatcher subexpression: 1]
		].
	^ aMatcher subexpression: 1

]

{ #category : #massaging }
SoupParser >> copy: aString replace: regexStringOrMatcher using: aBlock [
	| matcher |
	matcher := regexStringOrMatcher isMatcher
		ifTrue: [regexStringOrMatcher]
		ifFalse: [regexStringOrMatcher asRegex].
	^ matcher copy: aString translatingMatchesUsing: [
		:matchString |
		" Pass the matcher as it has all the information we need 
		and we can always reconstruct the matched string. "
		aBlock value: matcher.
		]
]

{ #category : #initializing }
SoupParser >> createRootTag [
	^ Soup new

]

{ #category : #parsing }
SoupParser >> decode [
	| decoder |
	decoder := SoupDecoder new.
	decoder convertSmartQuotesToHtml.
	decoder string: string.
	string := decoder decode.
]

{ #category : #handling }
SoupParser >> endData [
	self endData: SoupString
]

{ #category : #handling }
SoupParser >> endData: aClass [
	| data dataWithoutSeparators element |
	(currentData size = 0) ifTrue: [^ self].
	data := currentData contents.
	dataWithoutSeparators := data reject: [:aChar | aChar isSeparator].
	dataWithoutSeparators 
		ifEmpty: [
			data := (data includes: Character cr)
				ifTrue: [String cr]
				ifFalse: [' ']
		].
	currentData := ReadWriteStream on: String new.
	element := aClass parent: tagStack last previous: previous contents: data.
	previous := element.
	 
]

{ #category : #parsing }
SoupParser >> equals: aString from: anInteger [
	(anInteger > string size) ifTrue: [^ false].
	(anInteger + aString size > string size) ifTrue: [^ false].
	aString withIndexDo: [
		:eachChar :eachInteger |
		(string at: (eachInteger + anInteger)) = eachChar
			ifFalse: [^ false]
	].
	^ true
]

{ #category : #parsing }
SoupParser >> findInterestingFrom: anInteger [
	^ (interesting searchStream: (self readStreamFrom: anInteger))
		ifTrue: [(interesting subBeginning: 1) first]
		ifFalse: [string size]

]

{ #category : #handling }
SoupParser >> handleCData: aString [
	self endData.
	self handleData: aString.
	self endData: SoupCData.

	

]

{ #category : #handling }
SoupParser >> handleCharRef: aString [
	^ self handleData: (String streamContents: [
		:aStream |
		aStream 
			nextPut: $&;
			nextPut: $#;
			nextPutAll: aString;
			nextPut: $;])
]

{ #category : #handling }
SoupParser >> handleComment: aString [
	self endData.
	self handleData: aString.
	self endData: SoupComment

	

]

{ #category : #handling }
SoupParser >> handleData: aString [
	currentData nextPutAll: aString


]

{ #category : #handling }
SoupParser >> handleDataFrom: anInteger to: anotherInteger [
	anInteger to: anotherInteger do: [
		:i |
		currentData nextPut: (string at: i)
		]

]

{ #category : #handling }
SoupParser >> handleDeclaration: aString [
	self endData.
	self handleData: aString.
	self endData: SoupDeclaration.

	

]

{ #category : #handling }
SoupParser >> handleEndTag: aString [
	(quoteStack isEmpty not and: [quoteStack last ~= aString])
		ifTrue: [^ self handleData: (String streamContents: [
			:stream | 
				stream nextPutAll: '</'; nextPutAll: aString; nextPutAll: '>'
			])].
	self endData.
	self popToTag: aString.
	(quoteStack isEmpty not and: [quoteStack last = aString])
		ifTrue: [
			quoteStack removeLast.
			literal := quoteStack isEmpty not
		]

]

{ #category : #handling }
SoupParser >> handleEndTagFrom: anInteger to: anotherInteger tag: aString [
	(quoteStack isEmpty not and: [quoteStack last ~= aString])
		ifTrue: [^ self handleDataFrom: anInteger to: anotherInteger].
	self endData.
	self popToTag: aString.
	(quoteStack isEmpty not and: [quoteStack last = aString])
		ifTrue: [
			quoteStack removeLast.
			literal := quoteStack isEmpty not
		]

]

{ #category : #handling }
SoupParser >> handleEntityRef: aString [
	^ self handleData: (String streamContents: [
		:aStream |
		aStream 
			nextPut: $&;
			nextPutAll: aString;
			nextPut: $;])
]

{ #category : #handling }
SoupParser >> handleProcessingInstruction: aString [
	self endData.
	self handleData: aString.
	self endData: SoupProcessingInstruction 

	

]

{ #category : #handling }
SoupParser >> handleStartTagFrom: anInteger to: anotherInteger tag: aString attrs: aDictionary [
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
	

	
]

{ #category : #initializing }
SoupParser >> initialize [
	super initialize.
	interesting := '[&<]' asRegex.
	startTagOpen := '<[>a-zA-Z]' asRegex.
	charRef := '&#([0-9]+)[^0-9]' asRegex.
	entityRef := '&([a-zA-Z][-.a-zA-Z0-9]*)[^a-zA-Z0-9]' asRegex.
	endBracket := '[<>]' asRegex.
	tagFind := '[a-zA-Z][-_.a-zA-Z0-9:]*' asRegex.
	attrFind := '\s*([a-zA-Z_][-:.a-zA-Z_0-9]*)(\s*=\s*(''[^'']*''|"[^"]*"|[\-a-zA-Z0-9./,:;+*%?!&$()_#=~''"@]*))?' asRegex.
	incomplete := '&([a-zA-Z][a-zA-Z0-9]*|#[0-9]*)?|<([a-zA-Z][^<>]*|/([a-zA-Z][^<>]*)?|![^<>]*)?' asRegex.
	refFind := '&(([a-zA-Z][-.a-zA-Z0-9]*)|#(\w+))(;)?' asRegex.	
]

{ #category : #handling }
SoupParser >> isNestable: aString [
	^ parameters nestableTags includesKey: aString

]

{ #category : #handling }
SoupParser >> isResetNesting: aString [
	^ parameters resetNestingTags includesKey: aString
]

{ #category : #handling }
SoupParser >> isSelfClosingTag: aString [
	^ parameters selfClosingTags includes: aString
]

{ #category : #massaging }
SoupParser >> massage [
	string := self replace: '(<[^<>]*)/>' using: [:aMatcher | (aMatcher subexpression: 2) , '/>'].
	string := self replace: '<!\s+([^<>]*)>' using: [:aMatcher | '<!' , (aMatcher subexpression: 2) , '>'].

]

{ #category : #handling }
SoupParser >> numPops: aString [
	(tagStack size to: 2 by: -1) do: [
		:i |
		((tagStack at: i) name = aString) 
			ifTrue: [^ tagStack size - i + 1]
	].
	^ 0
]

{ #category : #accessing }
SoupParser >> parameters: anObject [
	parameters := anObject
]

{ #category : #parsing }
SoupParser >> parse [
	| position end |
	position := 0.
	end := string size.
	[position < end] whileTrue: [
		position := self parseAny: position.
		position < 0 ifTrue: [^ self]
	]

]

{ #category : #handling }
SoupParser >> parseAny: anInteger [
	| i j |
	i := anInteger.
	j := self findInterestingFrom: i.
	i < j ifTrue: [self handleDataFrom: i + 1 to: j].
	i := j.
	i >= string size ifTrue: [^ string size].
	^ ((string at: i + 1) = $<) 
		ifTrue: [self parsePossibleTag: i]
		ifFalse: [self parsePossibleRef: i]

]

{ #category : #parsing }
SoupParser >> parseCData: anInteger [
	| end |
	end := (string findString: ']]>' startingAt: anInteger) - 1.
	self handleCData: (string copyFrom: anInteger + 10 to: end).
	^ end + 3

]

{ #category : #parsing }
SoupParser >> parseCharRef: anInteger [
	self handleCharRef: (charRef subexpression: 2).
	^ ((charRef subEnd: 2) first) + 1

]

{ #category : #parsing }
SoupParser >> parseComment: anInteger [
	| matcher |
	matcher := '--\s*>' asRegex.
	(matcher searchStream: (self readStreamFrom: anInteger))
		ifTrue: [
			self handleComment: (string 
				copyFrom: anInteger + 5 
				to: (matcher subBeginning: 1) first).
			^( matcher subEnd: 1) first.
		].
	^ self parseIncomplete: anInteger
		
	
	

]

{ #category : #parsing }
SoupParser >> parseDeclaration: anInteger [
	| matcher |
	matcher := '<!\s*((''[^'']*''|"["]*"|\w+)(\s+(''[^'']*''|"["]*"|\w+)))*>' asRegex.
	(matcher matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifTrue: [
			self handleDeclaration: (matcher subexpression: 2).
			^( matcher subEnd: 1) first.
		].
	^ self parseIncomplete: anInteger
	

]

{ #category : #parsing }
SoupParser >> parseEndTag: anInteger [
	| end tag |
	(endBracket searchStream: (self readStreamFrom: anInteger  + 2)) 
		ifFalse: [^ self parseIncomplete: anInteger].
	end := (endBracket subEnd: 1) first.
	tag := string copyFrom: anInteger + 3 to: end - 1. 
	self handleEndTagFrom: anInteger + 1 to: end tag: tag.
	literal := false.
	^ end

]

{ #category : #parsing }
SoupParser >> parseEntityRef: anInteger [
	self handleEntityRef: (entityRef subexpression: 2).
	^ ((entityRef subEnd: 2) first) + 1

]

{ #category : #parsing }
SoupParser >> parseIncomplete: anInteger [
	| j |
	(incomplete matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifFalse: [
			self handleDataFrom: anInteger to: anInteger.
			^ anInteger + 1
		].
	j := (incomplete subEnd: 1) first.
	j >= string size ifTrue: [^ -1].
	self handleDataFrom: anInteger + 1 to: j.
	^ j
	

	
	

]

{ #category : #parsing }
SoupParser >> parseLiteral: anInteger [
	| i |
	i := anInteger + 1.
	self handleDataFrom: i to: i.
	^ i
	
	

]

{ #category : #parsing }
SoupParser >> parsePossibleDeclaration: anInteger [
	^ (self equals: '<![CDATA[' from: anInteger)
		ifTrue: [self parseCData: anInteger]
		ifFalse: [self parseDeclaration: anInteger]
	
	

]

{ #category : #parsing }
SoupParser >> parsePossibleLiteral: anInteger [
	^ (string size > (anInteger + 1))
		ifTrue: [self parseLiteral: anInteger]
		ifFalse: [self parseIncomplete: anInteger]
]

{ #category : #parsing }
SoupParser >> parsePossibleOtherTag: anInteger [
	^ ((string at: anInteger+2) = $/) 
		ifTrue: [self parseEndTag: anInteger]
		ifFalse: [self parsePossibleSpecialTag: anInteger]

]

{ #category : #parsing }
SoupParser >> parsePossibleRef: anInteger [
	literal ifTrue: [^ self parseLiteral: anInteger].
	(charRef matchesStreamPrefix: (self readStreamFrom: anInteger)) 
		ifTrue: [^ self parseCharRef: anInteger].
	(entityRef matchesStreamPrefix: (self readStreamFrom: anInteger)) 
		ifTrue: [^ self parseEntityRef: anInteger].
	^ self parseIncomplete: anInteger
]

{ #category : #parsing }
SoupParser >> parsePossibleSpecialTag: anInteger [
	literal ifTrue: [^ self parsePossibleLiteral: anInteger].
	(self equals: '<!--' from: anInteger) 
		ifTrue: [^ self parseComment: anInteger].
	((string at: anInteger + 2) = $?)  
		ifTrue: [^ self parseProcessingInstruction: anInteger].
	((string at: anInteger + 2) = $!)  
		ifTrue: [^ self parsePossibleDeclaration: anInteger].
	^ self parseIncomplete: anInteger
	
	

]

{ #category : #parsing }
SoupParser >> parsePossibleStartTag: anInteger [
	literal ifTrue: [^ self parseLiteral: anInteger].
	^ self parseStartTag: anInteger
	

]

{ #category : #parsing }
SoupParser >> parsePossibleTag: anInteger [
	^ (startTagOpen matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifTrue: [self parsePossibleStartTag: anInteger]
		ifFalse: [self parsePossibleOtherTag: anInteger]

]

{ #category : #parsing }
SoupParser >> parseProcessingInstruction: anInteger [
	| end |
	end := string findString: '>' startingAt: anInteger +1 .
	(end > 0)
		ifTrue: [
			|  processingInstruction |
			processingInstruction := string 
				copyFrom: anInteger + 3 
				to: end - 1.
			self handleProcessingInstruction: processingInstruction.
			^ end
		].
	^ self parseIncomplete: anInteger

]

{ #category : #parsing }
SoupParser >> parseStartTag: anInteger [
	| j k tag attrs |
	(endBracket searchStream: (self readStreamFrom: anInteger + 1))
		ifFalse: [^ self parseIncomplete: anInteger].
	attrs := Dictionary new.
	j := (endBracket subBeginning: 1) first.
	(tagFind matchesStreamPrefix: (self readStreamFrom: anInteger + 1))
		ifFalse: [self error: '#parseStartTagFrom: should not have been sent']
		ifTrue: [
			k := (tagFind subEnd: 1) first.
			tag := (tagFind subexpression: 1) asLowercase
		].
	[k < j] whileTrue: [
		k := self parseStartTagAttribute: k into: attrs.
		(k = -1) ifTrue: [k := j]
	].
	self handleStartTagFrom: anInteger to: j tag: tag attrs: attrs.
	(string at: j + 1) = $> ifTrue: [j := j + 1].
	^ j

]

{ #category : #parsing }
SoupParser >> parseStartTagAttribute: anInteger into: aDictionary [
	| attrName rest attrValue |
	(attrFind matchesStreamPrefix: (self readStreamFrom: anInteger))
		ifFalse: [^ -1].
	attrName := attrFind subexpression: 2.
	rest := attrFind subexpression: 3.
	attrValue := attrFind subexpression: 4.
	rest 
		ifNil: [attrValue := attrName]
		ifNotNil: [
			attrValue ifNotEmpty: [
				((attrValue first = $' and: [attrValue last = $']) 
					or: [attrValue first = $" and: [attrValue last = $"]])
					ifTrue: [
						attrValue := attrValue 
							copyFrom: 2 
							to: (attrValue size - 1)
					].
				attrValue := self 
					copy: attrValue 
					replace: refFind
					using: [:aMatcher | self convertRef: aMatcher].
			]
		].
	aDictionary at: attrName put: attrValue.
	^ (attrFind subEnd: 1) first.

]

{ #category : #parsing }
SoupParser >> parseString: aString [
	string := aString.
	self decode.
	self reset.
	self massage.
	self parse.
	self endData.
	[tagStack last isSoup] whileFalse: [self popTag].
	^ tagStack last
]

{ #category : #handling }
SoupParser >> popTag [
	tagStack removeLast.



]

{ #category : #handling }
SoupParser >> popToTag: aString [ 
	self popToTag: aString inclusive: true
]

{ #category : #handling }
SoupParser >> popToTag: aString inclusive: aBoolean [
	| numPops |
	(aString = Soup defaultName) ifTrue: [^ self].
	numPops := self numPops: aString.
	aBoolean ifFalse: [numPops := numPops - 1].
	numPops timesRepeat: [self popTag].

]

{ #category : #handling }
SoupParser >> pushTag: aTag [
	tagStack addLast: aTag.


]

{ #category : #parsing }
SoupParser >> readStreamFrom: anInteger [
	^ string readStream position: anInteger

]

{ #category : #massaging }
SoupParser >> replace: regexString using: aBlock [
	^ self copy: string replace: regexString using: aBlock

]

{ #category : #initializing }
SoupParser >> reset [
	currentData := ReadWriteStream on: String new.
	tagStack := OrderedCollection new.
	quoteStack := OrderedCollection new.
	literal := false.
	self pushTag: self createRootTag
]

{ #category : #handling }
SoupParser >> smartPop: aString [
	tagStack reverseDo: [
		:aTag |
		| nestingResetTriggers |
		((aTag isNil or: [aString = aTag name]) and: [(self isNestable: aString) not])
			ifTrue: [^ self popToTag: aString inclusive: true].
		nestingResetTriggers := parameters nestableTags at: aString ifAbsent: [#()].
		((nestingResetTriggers includes: aTag name) 
			or: [nestingResetTriggers isEmpty 
				and: [(self isResetNesting: aString) 
					and: [self isResetNesting: aTag name]]])
			ifTrue: [^ self popToTag: aTag name inclusive: false]
	]
]

{ #category : #accessing }
SoupParser >> string: anObject [
	string := anObject
]
