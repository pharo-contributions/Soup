"
SoupElement is the root of elements that are extracted during the parsing of an HTML document. Contrary to traditional HTML Parser, Soup produces a limited set of elements which approximate the HTML elements but supports querying and extracting information. 
"
Class {
	#name : #SoupElement,
	#superclass : #Object,
	#instVars : [
		'parent',
		'previous',
		'next',
		'previousSibling',
		'nextSibling'
	],
	#category : #'Soup-Core-Base'
}

{ #category : #'instance creation' }
SoupElement class >> parent: anElement previous: anotherElement [
	^ self new
		initializeWithParent: anElement previous: anotherElement;
		yourself
]

{ #category : #accessing }
SoupElement >> @ aString [
	^ self attributeAt: aString
]

{ #category : #accessing }
SoupElement >> attributeAt: aString [ 
	^ nil
]

{ #category : #accessing }
SoupElement >> attributeAt: aString ifAbsent: aBlock [
	^ nil
]

{ #category : #accessing }
SoupElement >> attributeAt: aString put: anotherString [

	
]

{ #category : #initializing }
SoupElement >> beNextOf: anElement [

	
	

]

{ #category : #initializing }
SoupElement >> beNextSiblingOf: anElement [

	
	

]

{ #category : #initializing }
SoupElement >> beParentOf: anElement [

]

{ #category : #initializing }
SoupElement >> bePreviousOf: anElement [
	next := anElement
]

{ #category : #initializing }
SoupElement >> bePreviousSiblingOf: anElement [
	nextSibling := anElement
	

]

{ #category : #'finding strings' }
SoupElement >> createFindStringBlock: anObject [
	(anObject isKindOf: Boolean) ifTrue: [^ [:aTag | anObject]].
	anObject isString ifTrue: [^ [:aString | aString contents = anObject]].
	anObject isMatcher ifTrue: [^ [:aString | anObject search: aString contents]].
	anObject isCollection ifTrue: [^ [:aString | anObject includes: aString contents]].
	^ anObject
]

{ #category : #'finding tags' }
SoupElement >> createFindTagBlock: anObject [
	(anObject isKindOf: Boolean) ifTrue: [^ [:aTag | anObject]].
	anObject isString ifTrue: [^ [:aTag | aTag name = anObject]].
	anObject isCollection ifTrue: [^ [:aTag | anObject includes: aTag name]].
	^ anObject

]

{ #category : #'finding strings' }
SoupElement >> findAllStrings: aStringOrRegex [
	"Returns all the strings equal to the argument. Note that the argument can be a regex to match several elements or a collection of strings"

	self subclassResponsibility
]

{ #category : #'finding strings' }
SoupElement >> findAllStrings: anObject stream: aStream [
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	self isString
			ifTrue: [(findBlock value: self) ifTrue: [aStream nextPut: self]]
			ifFalse:[ self childrenDo: [:ch | ch findAllStrings: anObject stream: aStream]].

]

{ #category : #'finding strings' }
SoupElement >> findChildString: anObject [
	^ nil
]

{ #category : #'finding tags' }
SoupElement >> findChildTag: anObject [
	^ nil
]

{ #category : #'finding strings' }
SoupElement >> findNextSiblingString: anObject [
	| findBlock |
	nextSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isString and: [findBlock value: nextSibling]) 
		ifTrue: [^ nextSibling].
	^ nextSibling findNextSiblingString: anObject
]

{ #category : #'finding strings' }
SoupElement >> findNextSiblingStrings: anObject [ 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findNextSiblingStrings: findBlock stream: aStream
	]
]

{ #category : #'finding strings' }
SoupElement >> findNextSiblingStrings: anObject stream: aStream [
	| findBlock |
	nextSibling ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(nextSibling isString and: [findBlock value: nextSibling]) 
		ifTrue: [aStream nextPut: nextSibling].
	nextSibling findNextSiblingStrings: anObject stream: aStream

]

{ #category : #'finding tags' }
SoupElement >> findNextSiblingTag: anObject [
	"Return the next sibling tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	nextSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isTag and: [findBlock value: nextSibling]) 
		ifTrue: [^ nextSibling].
	^ nextSibling findNextSiblingTag: anObject
]

{ #category : #'finding tags' }
SoupElement >> findNextSiblingTags: anObject [ 
	"Return the next sibling tags matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findNextSiblingTags: findBlock stream: aStream ]
]

{ #category : #'finding tags implementation' }
SoupElement >> findNextSiblingTags: anObject stream: aStream [
	| findBlock |
	nextSibling ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(nextSibling isTag and: [findBlock value: nextSibling]) 
		ifTrue: [aStream nextPut: nextSibling].
	nextSibling findNextSiblingTags: anObject stream: aStream

]

{ #category : #'finding strings' }
SoupElement >> findNextString: anObject [
	| findBlock |
	next ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(next isString and: [findBlock value: next]) ifTrue: [^ next].
	^ next findNextString: anObject
]

{ #category : #'finding strings' }
SoupElement >> findNextStrings: anObject [ 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findNextStrings: findBlock stream: aStream
	]
]

{ #category : #'finding strings' }
SoupElement >> findNextStrings: anObject stream: aStream [
	| findBlock |
	next ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(next isString and: [findBlock value: next]) ifTrue: [aStream nextPut: next].
	next findNextStrings: anObject stream: aStream

]

{ #category : #'finding tags' }
SoupElement >> findNextTag: anObject [
	"Return the next tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	next ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(next isTag and: [findBlock value: next]) ifTrue: [^ next].
	^ next findNextTag: anObject
]

{ #category : #'finding tags' }
SoupElement >> findNextTags: anObject [ 
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findNextTags: findBlock stream: aStream ]
]

{ #category : #'finding tags implementation' }
SoupElement >> findNextTags: anObject stream: aStream [
	| findBlock |
	next ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(next isTag and: [findBlock value: next]) ifTrue: [aStream nextPut: next].
	next findNextTags: anObject stream: aStream

]

{ #category : #'finding strings' }
SoupElement >> findPreviousSiblingString: anObject [
	| findBlock |
	previousSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(previousSibling isString and: [findBlock value: previousSibling]) 
		ifTrue: [^ previousSibling].
	^ previousSibling findPreviousSiblingString: anObject
]

{ #category : #'finding strings' }
SoupElement >> findPreviousSiblingStrings: anObject [ 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findPreviousSiblingStrings: findBlock stream: aStream
	]
]

{ #category : #'finding strings' }
SoupElement >> findPreviousSiblingStrings: anObject stream: aStream [
	| findBlock |
	previousSibling ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(previousSibling isString and: [findBlock value: previousSibling]) 
		ifTrue: [aStream nextPut: previousSibling].
	previousSibling findPreviousSiblingStrings: anObject stream: aStream

]

{ #category : #'finding tags' }
SoupElement >> findPreviousSiblingTag: anObject [
	"Return the previous sibling tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	previousSibling ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(findBlock value: previousSibling) ifTrue: [^ previousSibling].
	^ previousSibling findPreviousSiblingTag: anObject
]

{ #category : #'finding tags' }
SoupElement >> findPreviousSiblingTags: anObject [ 
	"Return the previous sibling tags matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream | 
			self findPreviousSiblingTags: findBlock stream: aStream ]
]

{ #category : #'finding tags implementation' }
SoupElement >> findPreviousSiblingTags: anObject stream: aStream [
	| findBlock |
	previousSibling ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(previousSibling isTag and: [findBlock value: previousSibling]) 
		ifTrue: [aStream nextPut: previousSibling].
	previousSibling findPreviousSiblingTags: anObject stream: aStream

]

{ #category : #'finding strings' }
SoupElement >> findPreviousString: anObject [
	| findBlock |
	previous ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(previous isString and: [findBlock value: previous]) ifTrue: [^ previous].
	^ previous findNextString: anObject
]

{ #category : #'finding strings' }
SoupElement >> findPreviousStrings: anObject [ 
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	^ Array streamContents: [
		:aStream |
		self findPreviousStrings: findBlock stream: aStream
	]
]

{ #category : #'finding strings' }
SoupElement >> findPreviousStrings: anObject stream: aStream [
	| findBlock |
	previous ifNil: [^ self].
	findBlock := self createFindStringBlock: anObject.
	(previous isString and: [findBlock value: previous]) ifTrue: [aStream nextPut: previous].
	previous findPreviousStrings: anObject stream: aStream

]

{ #category : #'finding tags' }
SoupElement >> findPreviousTag: anObject [
	"Return the next tag matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	previous ifNil: [^ nil].
	findBlock := self createFindTagBlock: anObject.
	(findBlock value: previous) ifTrue: [^ previous].
	^ previous findPreviousTag: anObject
]

{ #category : #'finding tags' }
SoupElement >> findPreviousTags: anObject [ 
	"Return the next tags matching the argument. AnObject can be a Boolean, a block, a string, or a collection of strings"
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	^ Array streamContents: [ :aStream |
			self findPreviousTags: findBlock stream: aStream ]
]

{ #category : #'finding tags implementation' }
SoupElement >> findPreviousTags: anObject stream: aStream [
	| findBlock |
	previous ifNil: [^ self].
	findBlock := self createFindTagBlock: anObject.
	(previous isTag and: [findBlock value: previous]) ifTrue: [aStream nextPut: previous].
	previous findPreviousTags: anObject stream: aStream

]

{ #category : #testing }
SoupElement >> hasAttribute: aString [
	^ (self attributeAt: aString) isNil not
]

{ #category : #accessing }
SoupElement >> hasAttributes [
	^ false
]

{ #category : #testing }
SoupElement >> ifString: aBlock [
]

{ #category : #testing }
SoupElement >> ifTag: aBlock [
	"When the receiver is a tag execute the argument aBlock. The result of the block execution is discarded"
]

{ #category : #initializing }
SoupElement >> initializeWithParent: anElement previous: anotherElement [
	self parent: anElement.
	self previous: anotherElement.
]

{ #category : #testing }
SoupElement >> isCData [
	^ false
]

{ #category : #testing }
SoupElement >> isComment [ 
	^ false
]

{ #category : #testing }
SoupElement >> isDeclaration [
	^ false
]

{ #category : #testing }
SoupElement >> isProcessingInstruction [
	^ false
]

{ #category : #testing }
SoupElement >> isSoup [
	^ false
]

{ #category : #testing }
SoupElement >> isString [
	^ false
]

{ #category : #testing }
SoupElement >> isTag [
	^ false
]

{ #category : #accessing }
SoupElement >> name [
	^ nil
]

{ #category : #accessing }
SoupElement >> next [
	^ next
]

{ #category : #accessing }
SoupElement >> next: anElement [
	anElement beNextOf: self.
	next := anElement


]

{ #category : #accessing }
SoupElement >> nextSibling [
	^ nextSibling
]

{ #category : #accessing }
SoupElement >> nextSibling: anElement [
	anElement beNextSiblingOf: self.
	nextSibling := anElement.
	
	

]

{ #category : #accessing }
SoupElement >> parent [
	^ parent
]

{ #category : #accessing }
SoupElement >> parent: anElement [
	anElement beParentOf: self.
	parent := anElement


]

{ #category : #accessing }
SoupElement >> previous [
	^ previous
]

{ #category : #accessing }
SoupElement >> previous: anElement [
	anElement ifNotNil: [anElement bePreviousOf: self].
	previous := anElement


]

{ #category : #accessing }
SoupElement >> previousSibling [
	^ previousSibling
]

{ #category : #accessing }
SoupElement >> previousSibling: anElement [
	anElement bePreviousSiblingOf: self.
	previousSibling := anElement.

]

{ #category : #printing }
SoupElement >> printOn: aStream [ 
	self subclassResponsibility

]
