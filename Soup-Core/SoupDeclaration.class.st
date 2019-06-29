"
Representing a declaration
"
Class {
	#name : #SoupDeclaration,
	#superclass : #SoupString,
	#category : #'Soup-Core-Base'
}

{ #category : #testing }
SoupDeclaration >> isDeclaration [
	^ true
]

{ #category : #printing }
SoupDeclaration >> printOn: aStream [
	aStream 
		nextPutAll: '<!';
		nextPutAll: contents;
		nextPutAll: '>'
]
