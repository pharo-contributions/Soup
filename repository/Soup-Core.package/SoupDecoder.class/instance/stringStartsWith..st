accessing
stringStartsWith: aString
	^ string beginsWith: (self decodePythonString: aString)
