as yet unclassified
fromSqueak: aCharacter
	^ FromTable at: aCharacter charCode ifAbsent: [aCharacter asciiValue]