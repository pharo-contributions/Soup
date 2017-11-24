finding tags
testFindTagIfPresent
	| soup body found |
	soup := Soup fromString: '<body><p>abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	body := soup body.
	body findTag: 'foo' ifPresent: [self fail].
	body findTag: #(foo bar) ifPresent: [self fail].
	body findTag: [:aTag | aTag name = 'foo'] ifPresent: [self fail].
	body findTag: [:aTag | aTag id = 'bar'] ifPresent: [self fail].
	found := nil.
	body findTag: 'span' ifPresent: [:aTag | found := aTag].
	self assert: (found attributeAt: 'class') = 'c'.
	found := nil.
	body findTag: #(span) ifPresent: [:aTag | found := aTag].
	self assert: (found attributeAt: 'class') = 'c'.
	found := nil.
	body findTag: [:aTag | aTag name = 'span'] ifPresent: [:aTag | found := aTag].
	self assert: (found attributeAt: 'class') = 'c'.
	found := nil.
	body findTag: [:aTag | aTag id = '2'] ifPresent: [:aTag | found := aTag].
	self assert: found name = 'br'
	