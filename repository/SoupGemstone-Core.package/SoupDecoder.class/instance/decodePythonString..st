convert
decodePythonString: aString
	^ String streamContents: [
		:aStream |
		(aString findTokens: '\x') do: [
			:eachString | 
			aStream nextPut: (Number 
				readFrom: eachString asUppercase 
				base: 16) asCharacter
		]
	]
	