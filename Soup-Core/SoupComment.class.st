"
Representing a comment
"
Class {
	#name : #SoupComment,
	#superclass : #SoupString,
	#category : #'Soup-Core-Base'
}

{ #category : #testing }
SoupComment >> isComment [
	^ true
]

{ #category : #printing }
SoupComment >> printOn: aStream [
	aStream 
		nextPutAll: '<!--';
		nextPutAll: contents;
		nextPutAll: '-->'
]
