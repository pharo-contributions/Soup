finding tags
testFindAllTags
	| soup |
	soup := Soup fromString: '<body><p>abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	soup findAllTags: [:e | self assert: e isTag. true].
	self assert: (soup findAllTags: [:e | true]) size = 5.
	self assert: (soup findAllTags: [:e | false]) size = 0.	
