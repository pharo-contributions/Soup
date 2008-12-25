enumerating
testChildStringsDo
	| soup stringsRemaining | 
	soup := Soup fromString: '<p>xyz</p>abc<span>123</span><br/>def'.
	stringsRemaining := #(abc def) asOrderedCollection.
	soup childStringsDo: [
		:aString |
		self assert: aString isString.
		stringsRemaining remove: aString contents.
	].
	self assert: stringsRemaining isEmpty
	