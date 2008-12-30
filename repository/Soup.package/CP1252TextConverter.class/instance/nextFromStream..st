as yet unclassified
nextFromStream: aStream
	| character |
	aStream isBinary ifTrue: [^ aStream basicNext].
	character := aStream basicNext.
	character ifNil: [^ nil].
	^ self toSqueak: character.
