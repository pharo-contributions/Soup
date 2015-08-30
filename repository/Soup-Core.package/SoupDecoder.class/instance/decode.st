convert
decode

	self possibleEncodings
		do: [ :eachString |
				| decodedString |
				decodedString := self decodeFrom: eachString.
				decodedString ifNotNil: [^ decodedString]].
	^ string