accessing
stringStartsWith: aString
	^ string startsWith: (self decodePythonString: aString)
