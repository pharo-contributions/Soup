finding tags
testPrevious
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findTag: [:e | e id = '2'].
	b previous: (SoupTag new name: 'newTag').
	c previous: SoupTag new.
	c previous attributeAt: 'at' put: 'newAt'.
	self assert: (b previous isTag).
	self assert: (b previous name = 'newTag').
	self assert: (c previous hasAttributes).
	self assert: ((c previous attributeAt: 'at') = 'newAt').

	