accessing
customProjectAttributes
	| attributes |
	attributes := OrderedCollection new.
	(Smalltalk hasClassNamed: #ZnClient)
		ifTrue: [ attributes add: #zinc ].
	^ attributes