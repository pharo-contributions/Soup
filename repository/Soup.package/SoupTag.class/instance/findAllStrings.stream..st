finding strings
findAllStrings: anObject stream: aStream
	| findBlock |
	findBlock := self createFindStringBlock: anObject.
	self childStringsDo: [
		:aString |
		 (findBlock value: aString) ifTrue: [aStream nextPut: aString].
		aString findAllStrings: findBlock stream: aStream.
	].