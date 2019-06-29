"
Provides XPath like access to elements
"
Class {
	#name : #SoupXPath,
	#superclass : #OrderedCollection,
	#category : #'Soup-XPath'
}

{ #category : #filtering }
SoupXPath >> / anObject [

	^ self child: anObject
]

{ #category : #filtering }
SoupXPath >> // anObject [

	^ self descendant: anObject
]

{ #category : #filtering }
SoupXPath >> @ attributeName [

	^ Array streamContents: [ :stream|
		self do: [ :tag|
			(tag @ attributeName) ifNotNilDo: [ :value| stream nextPut: value ]]]
]

{ #category : #filtering }
SoupXPath >> ancestor [

	| ancestors ancestor |
	
	ancestors := Set new.
	
	self do: [ :tag|
		ancestor := tag. 
		[ancestor := ancestor parent] whileNotNil: [ ancestors add: ancestor ]].
	
	^ SoupXPath withAll: ancestors.
]

{ #category : #filtering }
SoupXPath >> attribute: attributeName matching: aRegex [

	^ self select: [ :tag| 
			(tag hasAttribute: attributeName) and: [ aRegex matches: tag @ attributeName ]]
]

{ #category : #filtering }
SoupXPath >> child [

	^ self child: [ :tag| true]
]

{ #category : #filtering }
SoupXPath >> child: anObject [

	^ self class streamContents: [ :stream| 
			self do: [ :tag|
				tag findAllChildTags: anObject stream: stream]].
]

{ #category : #filtering }
SoupXPath >> descendant [

	^ self descendant: [ :tag| true]
]

{ #category : #filtering }
SoupXPath >> descendant: anObject [

	^ self class streamContents: [ :stream| 
			self do: [ :tag|
				tag findAllTags: anObject stream: stream]].
]

{ #category : #filtering }
SoupXPath >> parent [

	|parents|
	
	parents := Set new.
	
	self do: [ :tag| parents add: tag parent ].
	
	^ SoupXPath withAll: parents.
]
