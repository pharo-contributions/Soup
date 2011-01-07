enumerating
testChildStringsDo
	"self debug: #testChildStringsDo"
	"childStringsDo: evaluates a block only on leaves which are plain strings"
	| soup stringsRemaining | 
	soup := Soup fromString: '<p>xyz</p>abc<span>123</span><br/>def'.
	stringsRemaining := #(abc def) asOrderedCollection.
	soup childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	self assert: stringsRemaining isEmpty.
	
	stringsRemaining := #(xyz) asOrderedCollection.
	soup := Soup fromString: '<p>xyz</p>'.
	"While xyz was not considered as a string in the previous text, it is now one since we accessed it using message p."
	soup p childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	self assert: stringsRemaining isEmpty.
	
	stringsRemaining := #(xyz) asOrderedCollection.
	soup := Soup fromString: '<b>xyz</b>'.
	soup childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	"Here b is decorated so it is not iterated"
	self deny: stringsRemaining isEmpty.
	
	stringsRemaining := #(xyz) asOrderedCollection.
	soup := Soup fromString: '<b>xyz</b>'.
	"Here we access the string using the message b so it is iterated."
	soup b childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	self assert: stringsRemaining isEmpty.
	
	