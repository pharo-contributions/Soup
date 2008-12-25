accessing
testSize
	| soup |
	soup := Soup fromString: '<top>1<b>2</b>3</top><hr/>'.
	self assert: (soup size = 2)