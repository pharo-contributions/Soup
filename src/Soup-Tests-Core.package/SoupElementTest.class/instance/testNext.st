finding tags
testNext
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findTag: [:e | e id = '2'].
	b next: (SoupTag new name: 'newTag').
	c next: SoupTag new.
	c next attributeAt: 'at' put: 'newAt'.
	self assert: (b next isTag).
	self assert: (b next name = 'newTag').
	self assert: (c next hasAttributes).
	self assert: ((c next attributeAt: 'at') = 'newAt').

	