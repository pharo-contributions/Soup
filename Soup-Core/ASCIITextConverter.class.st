"
A text converter for ASCII text
"
Class {
	#name : #ASCIITextConverter,
	#superclass : #TextConverter,
	#category : #'Soup-Core-TextConversion'
}

{ #category : #encodings }
ASCIITextConverter class >> encodingNames [ 
	^ #('ascii') copy

]

{ #category : #friend }
ASCIITextConverter >> currentCharSize [

	^ 1.

]

{ #category : #conversion }
ASCIITextConverter >> nextFromStream: aStream [
	| character |
	character := aStream basicNext.
	character charCode > 127 
		ifTrue: [self error: 'Invalid ASCII character ' , character asString].
	^ character

]

{ #category : #conversion }
ASCIITextConverter >> nextPut: aCharacter toStream: aStream [ 
	aCharacter charCode > 127 
		ifTrue: [self error: 'Invalid ASCII character ' , aCharacter asString].
	aStream basicNextPut: (Character value: aCharacter charCode).

]
