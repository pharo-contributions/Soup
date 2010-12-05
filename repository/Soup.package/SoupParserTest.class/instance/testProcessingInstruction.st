tests
testProcessingInstruction
	| soup data |
	soup := Soup fromString: 'abc<?pi>def'.
	data := soup findString: [:e | e isProcessingInstruction].
	self assert: data contents = 'pi'.
	self assert: data printString = '<?pi>'.
	self assert: data next contents = 'def'.