"
Representing a processing instruction
"
Class {
	#name : #SoupProcessingInstruction,
	#superclass : #SoupString,
	#category : #'Soup-Core-Base'
}

{ #category : #testing }
SoupProcessingInstruction >> isProcessingInstruction [
	^ true
]

{ #category : #printing }
SoupProcessingInstruction >> printOn: aStream [
	aStream 
		nextPutAll: '<?';
		nextPutAll: contents;
		nextPutAll: '>'
]
