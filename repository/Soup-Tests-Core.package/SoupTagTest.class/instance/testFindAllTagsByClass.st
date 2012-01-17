finding tags
testFindAllTagsByClass
	
	| soup body |
	soup := Soup fromString: '<body><p class="c">abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	body := soup body.
	self assert: (body findAllTagsByClass: 'c') first name = 'p'.
	self assert: (body findAllTagsByClass: 'c') second name = 'span'.
"
	self assert: (body findTagByClass: 'c') next contents = 'xyz'.
	self assert: (body findTagByClass: 'b') name = 'p'.
	self assert: (body findTag: [:aTag | aTag name = 'br']) id = '1'.
	self assert: (body findTag: [:aTag | aTag id = '2']) name = 'br'.
	self assert: (body span) name = 'span'
"