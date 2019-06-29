"
Representing a CDATA section
"
Class {
	#name : #SoupCData,
	#superclass : #SoupString,
	#category : #'Soup-Core-Base'
}

{ #category : #testing }
SoupCData >> isCData [
	^ true
]

{ #category : #printing }
SoupCData >> printOn: aStream [
	aStream 
		nextPutAll: '<![CDATA[';
		nextPutAll: contents;
		nextPutAll: ']]>'
]
