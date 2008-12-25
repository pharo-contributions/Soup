as yet unclassified
convertEntityRef: aString
	^ parameters entityDefs at: aString ifAbsent: [nil]
