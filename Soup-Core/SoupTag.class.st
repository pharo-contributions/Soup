"
Instances represent a tag
"
Class {
	#name : #SoupTag,
	#superclass : #SoupElement,
	#instVars : [
		'name',
		'attributes',
		'children',
		'isSelfClosing'
	],
	#category : #'Soup-Core-Base'
}

{ #category : #'instance creation' }
SoupTag class >> named: aString [
	^ self new 
		name: aString;
		yourself
]

{ #category : #'instance creation' }
SoupTag class >> named: aString parent: anElement previous: anotherElement [
	^ (self parent: anElement previous: anotherElement)
		name: aString;
		yourself
]

{ #category : #'finding tags' }
SoupTag >> / anObject [
	^ SoupXPath withAll: (self findAllChildTags: anObject)
]

{ #category : #'finding tags' }
SoupTag >> // anObject [
	^ SoupXPath withAll: (self findAllTags: anObject)
]

{ #category : #adding }
SoupTag >> addChild: aChild [
	^ children add: aChild
]

{ #category : #converting }
SoupTag >> asXPath [
	^ SoupXPath with: self
]

{ #category : #accessing }
SoupTag >> attributeAt: aString [ 
	^ attributes at: aString ifAbsent: [nil]
]

{ #category : #accessing }
SoupTag >> attributeAt: aString ifAbsent: aBlock [
	^ attributes at: aString ifAbsent: aBlock
]

{ #category : #accessing }
SoupTag >> attributeAt: aString put: anotherString [
	^ attributes at: aString put: anotherString
]

{ #category : #initializing }
SoupTag >> beParentOf: anElement [
	children ifNotEmpty: [anElement previousSibling: children last].
	children add: anElement.
	
]

{ #category : #accessing }
SoupTag >> beSelfClosing [
	isSelfClosing := true
]

{ #category : #accessing }
SoupTag >> childAt: anInteger [
	"Return the anInteger th child of the receiver"
	^ children at: anInteger
]

{ #category : #enumerating }
SoupTag >> childStringsDo: aBlock [
	"Apply the argument, an Unary block, on the direct children that are plain strings. Strings decorated (e.g., <p>, <b>...) are not iterated"
	
	self childrenDo: 
		[ :anElement |
			anElement ifString: [aBlock value: anElement]]
]

{ #category : #enumerating }
SoupTag >> childTagsDo: aBlock [
	"Apply the arguments on the direct tag elements of the receiver"
	
	self childrenDo: [ :anElement |
		anElement ifTag: [aBlock value: anElement] ]
]

{ #category : #enumerating }
SoupTag >> children [
	"Returns the direct childent of the receiver so that we can use iterators"
	
	^ children
]

{ #category : #enumerating }
SoupTag >> childrenDo: aBlock [
	"Apply the argument on the direct childent of the receiver"
	
	children do: aBlock
]

{ #category : #'error handling' }
SoupTag >> doesNotUnderstand: aMessage [
	" Treat only unary messages as short hand attribute or child access."
	(aMessage arguments size > 0)
		ifTrue: [^ super doesNotUnderstand: aMessage].
	attributes 
		at: aMessage selector
		ifPresent: [:aString | ^ aString].
	self 
		findTag: aMessage selector
		ifPresent: [:aTag | ^ aTag].
	^ nil
]

{ #category : #'finding tags' }
SoupTag >> findAllChildTags: anObject [ 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
		self findAllChildTags: findBlock stream: aStream ]
]

{ #category : #'finding tags' }
SoupTag >> findAllChildTags: anObject stream: aStream [
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [ :aTag |
			(findBlock value: aTag) ifTrue: [aStream nextPut: aTag]].
]

{ #category : #'finding strings' }
SoupTag >> findAllStrings: anObject [
	"Returns all the strings equal to the argument. Note that the argument can be a string, a Boolean, a regex or a collection of strings to match several elements"
	
	| block |
	block := self createFindStringBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findAllStrings: block stream: aStream ]
]

{ #category : #'finding tags' }
SoupTag >> findAllTags: anObject [ 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
		self findAllTags: findBlock stream: aStream ]
]

{ #category : #'finding tags' }
SoupTag >> findAllTags: anObject stream: aStream [
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [ :aTag |
			(findBlock value: aTag) ifTrue: [aStream nextPut: aTag].
			aTag findAllTags: findBlock stream: aStream ].
]

{ #category : #'finding tags' }
SoupTag >> findAllTagsByClass: aString [ 
	^ Array streamContents:  [ :aStream | 
				self 
					findAllTagsByClass: aString
					stream: aStream ]
]

{ #category : #'finding tags' }
SoupTag >> findAllTagsByClass: aString stream: aStream [ 
	self childTagsDo: 
		[ :aTag | 
		(aTag hasClass: aString)
			ifTrue: [ aStream nextPut: aTag ].
		aTag 
			findAllTagsByClass: aString
			stream: aStream ]
]

{ #category : #'finding strings' }
SoupTag >> findChildString: anObject [
	"Returns the strings matching anObject in the direct children of the receiver. anObject can be a Boolean, a string, a regex or a collection of strings."

	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	self childStringsDo: [ :aString |
		(findBlock value: aString)  ifTrue: [^ aString]].
	^ nil
]

{ #category : #'finding tags' }
SoupTag >> findChildTag: anObject [
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [
		:aTag |
		(findBlock value: aTag)  ifTrue: [^ aTag].
	].
	^ nil
]

{ #category : #'finding strings' }
SoupTag >> findString: anObject [
	"Find the first occurrence of a String satisfying the argument. The argument can e a Boolean, a String, a Regex or a collection of strings"
	| block |
	block := self createFindStringBlock: anObject.
	self childrenDo: [ :eachElement |
		eachElement isString
			ifTrue: [(block value: eachElement) ifTrue: [^ eachElement]]
			ifFalse: [
				| found |
				found := eachElement findString: block.
				found ifNotNil: [^ found]
			]
	].
	^ nil
		
]

{ #category : #'finding strings' }
SoupTag >> findString: anObject ifPresent: aBlock [
	"Execute aBlock, if a string satisfying anObject is found. anObject can be a Boolean, a string, a regex or a collection of strings."
	| found |
	found := self findString: anObject.
	^ found ifNotNil: [aBlock value: found]
]

{ #category : #'finding tags' }
SoupTag >> findTag: anObject [
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [
		:aTag |
		| found |
		(findBlock value: aTag) 
			ifTrue: [^ aTag].
		found := (aTag findTag: findBlock).
		found ifNotNil: [^ found]
	].
	^ nil
]

{ #category : #'finding tags' }
SoupTag >> findTag: anObject ifPresent: aBlock [
	| found |
	found := self findTag: anObject.
	^ found ifNotNil: [aBlock value: found]

]

{ #category : #'finding tags' }
SoupTag >> findTagByClass: aString [
	^ self findTagByClass: aString ifAbsent: [nil]

]

{ #category : #'finding tags' }
SoupTag >> findTagByClass: aString ifAbsent: aBlock [
	self findTag: [:aTag | aTag hasClass: aString]
		ifPresent: [:aTag | ^ aTag].
	^ aBlock value

]

{ #category : #'finding tags' }
SoupTag >> findTagByClass: aString ifPresent: aBlock [
	^ self 
		findTag: [:aTag | aTag hasClass: aString]
		ifPresent: aBlock

]

{ #category : #accessing }
SoupTag >> hasAttributes [
	^ attributes size > 0 
]

{ #category : #accessing }
SoupTag >> hasClass: aString [
	^ (self attributeAt: 'class')
		ifNil: [ false ]
		ifNotNil:
			[ :classAttribute | (Character space split: classAttribute) includes: aString ]
]

{ #category : #testing }
SoupTag >> ifTag: aBlock [
	"When the receiver is a tag execute the argument aBlock. The result of the block execution is discarded"
	
	aBlock value
]

{ #category : #'finding tags' }
SoupTag >> includesTag: aTag [
	self childTagsDo: [ :tag|
		tag = aTag
			ifTrue: [ ^ true ].
		(tag includesTag: aTag)
			ifTrue: [ ^ true ]].
	^ false
]

{ #category : #initializing }
SoupTag >> initialize [
	super initialize.
	attributes := Dictionary new.
	children := OrderedCollection new.
	isSelfClosing := false.
]

{ #category : #testing }
SoupTag >> isSelfClosing [
	^ isSelfClosing
]

{ #category : #testing }
SoupTag >> isTag [
	^ true
]

{ #category : #accessing }
SoupTag >> name [
	^ name
]

{ #category : #accessing }
SoupTag >> name: anObject [
	name := anObject
]

{ #category : #printing }
SoupTag >> printAttributeValue: aString on: aStream [

	| quote string entityMatcher bareSymbolMatcher replacementEntities |
	(aString includes: $")
		ifTrue: 
			[ string := (aString includes: $')
				ifTrue: [aString copyReplaceAll: '''' with: '&squot;']
				ifFalse: [aString].
			quote := $' ]
		ifFalse: 
			[ string := aString.
			quote := $" ].
	bareSymbolMatcher := '[<>&]' asRegex.
	entityMatcher := '(#\d+;)|(#x[0-9a-fA-F]+;)|(\w+;)' asRegex.
	replacementEntities := Dictionary newFrom: {'<' -> '&lt;'. '>' -> '&gt;'. '&' -> '&amp;'}.
	string := bareSymbolMatcher 
						copy: string 
						translatingMatchesUsing: 
							[ :matchedString |
							(entityMatcher matchesStreamPrefix: (string readStream
								position: (bareSymbolMatcher subEnd: 1) first;
								yourself))
								ifTrue: [matchedString]
								ifFalse: [replacementEntities at: matchedString]].
	aStream 
		nextPut: quote;
		nextPutAll: string;
		nextPut: quote.

]

{ #category : #printing }
SoupTag >> printOn: aStream [
	aStream 
		nextPut: $<;
		nextPutAll: name.
	attributes keysAndValuesDo: 
		[ :key :value |
		aStream 
			nextPut: $ ;
			nextPutAll: key;
			nextPutAll: '='.
		self printAttributeValue: value on: aStream.].
	isSelfClosing 
		ifTrue: [aStream nextPutAll: ' />']
		ifFalse: [
			aStream nextPut: $>.
			children do: 
				[ :eachElement |
				eachElement printOn: aStream].
			aStream 
				nextPutAll: '</';
				nextPutAll: name;
				nextPut: $> ]
]

{ #category : #accessing }
SoupTag >> size [
	"Return the number of direct children an element has."
	
	^ children size
]

{ #category : #accessing }
SoupTag >> string [
	"Return the string representation of the receiver if the receiver is not composed of subnodes."
	^ (children size = 1 and: [(children at: 1) isString])
				ifTrue: [(children at: 1) contents]
				ifFalse: [nil]
]

{ #category : #accessing }
SoupTag >> text [
	"Return a string containing the concatenation of the texts in the receiver. For an example, have a look at (SoupDocumentation>>#accessingText)"

	^ String streamContents: 
			[ :aStream |
				children do: [ :eachElement | 
							aStream nextPutAll: eachElement text ] ]
]
