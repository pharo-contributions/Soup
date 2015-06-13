printing
printAttributeValue: aString on: aStream

	| quote string entityMatcher bareSymbolMatcher replacementEntities |
	(aString includes: $")
		ifTrue: 
			[ string := (aString includes: $')
				ifTrue: [aString copyReplaceAll: '''' with: '&squot;']
				ifFalse: [aString].
			quote := $' ]
		ifFalse: 
			[ string := aString.
			quote := $" ].
	bareSymbolMatcher := '[<>&]' asRegex.
	entityMatcher := '(#\d+;)|(#x[0-9a-fA-F]+;)|(\w+;)' asRegex.
	replacementEntities := Dictionary newFrom: {'<' -> '&lt;'. '>' -> '&gt;'. '&' -> '&amp;'}.
	string := bareSymbolMatcher 
						copy: string 
						translatingMatchesUsing: 
							[ :matchedString |
							(entityMatcher matchesStreamPrefix: (string readStream
								position: (bareSymbolMatcher subEnd: 1) first;
								yourself))
								ifTrue: [matchedString]
								ifFalse: [replacementEntities at: matchedString]].
	aStream 
		nextPut: quote;
		nextPutAll: string;
		nextPut: quote.
