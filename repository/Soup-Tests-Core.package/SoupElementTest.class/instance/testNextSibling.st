accessing
testNextSibling
	| soup li |
	soup := Soup fromString: '<ul><li>1<p>A</p>B<li>2<li>3</ul>'.
	li := (soup findTag: 'li') nextSibling.
	self assert: li name = 'li'.
	self assert: li string = '2'.
	self assert: (soup findString: '1') nextSibling name = 'p'.
	self assert: (soup findTag: 'p') nextSibling contents = 'B'.
	self assert: (soup findTag: 'p') nextSibling previousSibling nextSibling contents = 'B'.