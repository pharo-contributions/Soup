finding tags
testFindAllTagsByClass
	
	| soup body childFound |
	soup := Soup fromString: '<body><p class="c">abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p><p class="b">other</p></body>'.
	body := soup body.
	self assert: (body findAllTagsByClass: 'c') first name = 'p'.
	self assert: (body findAllTagsByClass: 'c') second name = 'span'.
	childFound := false.
	body findTagByClass: 'c' ifPresent: [: aTag | childFound := true ].
	self assert: childFound. 
	self assert: (body findTagByClass: 'c') text = 'abcdefxyz'.
	self assert: (body findTagByClass: 'b') name = 'p'.
