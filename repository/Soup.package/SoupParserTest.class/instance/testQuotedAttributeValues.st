tests
testQuotedAttributeValues
	| text soup |
	self 
		assertSoupFrom: '<foo attr=''bar''></foo>' 
		printsAs: '<foo attr="bar"></foo>'.
	self 
		assertSoupFrom: '<foo attr=''bar "brawls" happen''>a</foo>' 
		printsAs: '<foo attr=''bar "brawls" happen''>a</foo>'.
		
	text := '<foo attr=''bar "brawls" happen''>a</foo>'.
	soup := Soup fromString: text.
	self assert: soup printString = text.
	soup foo attributeAt: 'attr' put: 'Brawls happen at "Bob''s Bar"'.
	self assert: soup printString = '<foo attr=''Brawls happen at "Bob&squot;s Bar"''>a</foo>'.
	
	self 
		assertSoupFrom: '<this is="really messed up & stuff">' 
		printsAs: '<this is="really messed up &amp; stuff"></this>'.
	
	" This is not what the original author had in mind, 
	but it's a legitimate interpretation of what they wrote. "
	self 
		assertSoupFrom: '<a href="foo</a>, </a><a href="bar">baz</a>' 
		printsAs: '<a href="foo&lt;/a&gt;, &lt;/a&gt;&lt;a href="></a>, <a href="bar">baz</a>'.

	" SGMLParser generates bogus parse events when attribute values
	contain embedded brackets, but at least Beautiful Soup fixes
	it up a little. "
	self 
		assertSoupFrom: '<a b="<a>">'
		printsAs: '<a b="&lt;a&gt;"></a><a>"></a>' .
	self 
		assertSoupFrom: '<a href="http://foo.com/<a> and blah and blah'
		printsAs: '<a href=''"http://foo.com/''></a><a> and blah and blah</a>'.
