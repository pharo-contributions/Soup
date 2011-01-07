tests
testBadNestedTables
	| soup |
	soup := Soup fromString: '<table><tr><table><tr id=''nested''>'.
	self assert: soup table tr table tr id = 'nested'