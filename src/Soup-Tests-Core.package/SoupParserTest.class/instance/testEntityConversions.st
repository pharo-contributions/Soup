tests
testEntityConversions
	| text soup |
	text := '&lt;&lt;sacr&eacute;&#32;bleu!&gt;&gt;'.
	soup := Soup fromString: text.
	self assert: soup printString = text.