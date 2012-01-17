finding tags
testNextSibling
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findTag: [:e | e id = '2'].
	b nextSibling: (SoupTag new name: 'newTag').
	c nextSibling: SoupTag new.
	c nextSibling attributeAt: 'at' put: 'newAt'.
	self assert: (b nextSibling isTag).
	self assert: (b nextSibling name = 'newTag').
	self assert: (c nextSibling hasAttributes).
	self assert: ((c nextSibling attributeAt: 'at') = 'newAt').

	