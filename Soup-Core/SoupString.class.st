"
A string element
"
Class {
	#name : #SoupString,
	#superclass : #SoupElement,
	#instVars : [
		'contents'
	],
	#category : #'Soup-Core-Base'
}

{ #category : #'instance creation' }
SoupString class >> parent: anElement previous: anotherElement contents: aString [
	^ (super parent: anElement previous: anotherElement)
		contents: aString;
		yourself
]

{ #category : #accessing }
SoupString >> contents [
	^ contents
]

{ #category : #accessing }
SoupString >> contents: anObject [
	contents := anObject
]

{ #category : #'finding strings' }
SoupString >> findAllStrings: aStringOrRegex [
	"There is no string inside a string"
	^ #()
]

{ #category : #'finding tags' }
SoupString >> findAllTags: anObject [
	^ #()
]

{ #category : #'finding strings' }
SoupString >> findString: anObject [
	^ nil
]

{ #category : #'finding tags' }
SoupString >> findTag: anObject [
	^ nil
]

{ #category : #testing }
SoupString >> ifString: aBlock [
	^ aBlock value.
]

{ #category : #testing }
SoupString >> isString [
	^ true
]

{ #category : #printing }
SoupString >> printOn: aStream [
	aStream nextPutAll: contents.

]

{ #category : #accessing }
SoupString >> readStream [
	^ contents readStream
]

{ #category : #accessing }
SoupString >> text [
	^ contents
]
