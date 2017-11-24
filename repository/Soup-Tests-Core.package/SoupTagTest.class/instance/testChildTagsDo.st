enumerating
testChildTagsDo
	| soup tagsRemaining | 
	soup := Soup fromString: '<p>abc</p><span>def</span><br/>'.
	tagsRemaining := #(p span br) asOrderedCollection.
	soup childTagsDo: [ :aTag |
		self assert: aTag isTag.
		tagsRemaining remove: aTag name ].
	self assert: tagsRemaining isEmpty
	