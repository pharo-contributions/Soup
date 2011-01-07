finding tags
testFindTag
	
	| soup body |
	soup := Soup fromString: '<body><p>abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	body := soup body.
	self assert: (body findTag: 'p') name = 'p'.
	self assert: (body findTag: #(p br)) name = 'p'.
	self assert: (body findTag: [:aTag | aTag name = 'br']) id = '1'.
	self assert: (body findTag: [:aTag | aTag id = '2']) name = 'br'.
	self assert: (body span) name = 'span'
