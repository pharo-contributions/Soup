Class {
	#name : #SoupParserTest,
	#superclass : #TestCase,
	#category : #'Soup-Tests-Core'
}

{ #category : #tests }
SoupParserTest >> assertSoupFrom: aString printsAs: anotherString [
	| soup |
	soup := Soup fromString: aString.
	self assert: soup printString = anotherString
]

{ #category : #tests }
SoupParserTest >> parseOtherDeclaration: anInteger [
]

{ #category : #tests }
SoupParserTest >> testBadNestedTables [
	| soup |
	soup := Soup fromString: '<table><tr><table><tr id=''nested''>'.
	self assert: soup table tr table tr id = 'nested'
]

{ #category : #tests }
SoupParserTest >> testCData [
	| soup data |
	soup := Soup fromString: '<root>foo<![CDATA[foobar]]>bar</root>'.
	data := soup findString: 'foo.*bar' asRegex. 
	self assert: data contents = 'foobar'.
	self assert: data printString = '<![CDATA[foobar]]>'
]

{ #category : #tests }
SoupParserTest >> testComments [
	| soup xml |
	xml := 'foo<!--foobar-->baz'.
	soup := Soup fromString: xml.
	self assert: soup printString = xml.
	self assert: (soup findString: 'foobar') isComment
	
]

{ #category : #tests }
SoupParserTest >> testDeclaration [
	| xml |
	xml := 'foo<!DOCTYPE foobar>baz'.
	self assertSoupFrom: xml printsAs: xml.
	
]

{ #category : #tests }
SoupParserTest >> testEntitiesInAttributeValues [
	| uri link |
	self assertSoupFrom: '<x t="x&#241;">' printsAs: '<x t="xñ"></x>'.
	self assertSoupFrom: '<x t="x&#xf1;">' printsAs: '<x t="xñ"></x>'.
	uri := 'http://crummy.com?sacr&eacute;&amp;bleu'.
	link := '<a href="{1}"></a>' format: uri.
	self assertSoupFrom: link printsAs: link.


]

{ #category : #tests }
SoupParserTest >> testEntityConversions [
	| text soup |
	text := '&lt;&lt;sacr&eacute;&#32;bleu!&gt;&gt;'.
	soup := Soup fromString: text.
	self assert: soup printString = text.
]

{ #category : #tests }
SoupParserTest >> testEntityReplacement [
	self assertSoupFrom: '<b>hello&nbsp;there</b>' printsAs: '<b>hello&nbsp;there</b>'
]

{ #category : #tests }
SoupParserTest >> testIncompleteDeclaration [
	" BeautifulSoup will parse this as 'a<!b <p>c'. It simply gives up after 
	failing to parse a doctype. I can't see the logic of this. Hence: "
	self assertSoupFrom: 'a<!b <p>c' printsAs: 'a<!b <p>c</p>'
]

{ #category : #tests }
SoupParserTest >> testJunkInDeclaration [
	self 
		assertSoupFrom: '<! Foo = -8>a'
		printsAs: '<!Foo = -8>a'
]

{ #category : #tests }
SoupParserTest >> testLiteralMode [
	| soup |
	soup := Soup fromString: '<script>if (i<imgs.length)</script><b>Foo</b>'.
	self assert: soup script string = 'if (i<imgs.length)'.
	self assert: soup b string = 'Foo'.
	
]

{ #category : #tests }
SoupParserTest >> testNakedAmpersands [
	| invalidUrl validUrl |
	invalidUrl := '<a href="http://example.org?a=1&b=2;3">foo</a>'.
	validUrl := invalidUrl copyReplaceAll: '&'  with: '&amp;'.
	self assertSoupFrom: invalidUrl printsAs: validUrl.
	self assertSoupFrom: validUrl printsAs: validUrl.
	

]

{ #category : #tests }
SoupParserTest >> testNamespaceNode [
	| soup tag |
	soup := Soup fromString: '<issues:id>123</issues:id>'.
	tag := (soup findTag: 'issues:id').
	self assert: tag name = 'issues:id'.
	self assert: tag string = '123'.
	
]

{ #category : #tests }
SoupParserTest >> testNestedTables [
	| soup | 
	soup := Soup fromString: '<table id="1"><tr><td>Here''s another table:
        <table id="2"><tr><td>Juicy text</td></tr></table></td></tr></table>'.
	self assert: soup table table td string = 'Juicy text'.
	self assert: (soup findAllTags: 'table') size = 2.
	self assert: (soup table findAllTags: 'table') size = 1.
	self assert: (soup findTag: [:e | e name = 'table' and: [e id = '2']]) parent parent parent name = 'table'.
	soup := Soup fromString: '<table><tr><td><div><table>Foo</table></div></td></tr></table>'.
	self assert: soup table tr td div table string = 'Foo'.
	soup := Soup fromString: '<table><thead><tr>Foo</tr></thead><tbody><tr>Bar</tr></tbody>
        <tfoot><tr>Baz</tr></tfoot></table>'.
	self assert: soup table thead tr string = 'Foo'.
]

{ #category : #tests }
SoupParserTest >> testParaInsideBlockquote [
	| soup |
	soup := Soup fromString: '<blockquote><p><b>Foo</blockquote><p>Bar'.
	self assert: soup blockquote p b string = 'Foo'.
	self assert: soup blockquote b string = 'Foo'.
	self assert: (soup findChildTag: 'p') string = 'Bar'
]

{ #category : #tests }
SoupParserTest >> testProcessingInstruction [
	| soup data |
	soup := Soup fromString: 'abc<?pi>def'.
	data := soup findString: [:e | e isProcessingInstruction].
	self assert: data contents = 'pi'.
	self assert: data printString = '<?pi>'.
	self assert: data next contents = 'def'.
]

{ #category : #tests }
SoupParserTest >> testQuotedAttributeValues [
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

]

{ #category : #tests }
SoupParserTest >> testSelfClosingTag [
	self assert: ((Soup fromString: 'Foo<br/>Bar') findTag: 'br') printString = '<br />'.
	self assert: (Soup fromString: '<p>test1<br/>test2</p>') printString = (Soup fromString: '<p>test1<br />test2</p>') printString.
	self assert: (Soup fromString: '<p>test1<selfclosing>test2') printString = '<p>test1<selfclosing>test2</selfclosing></p>'.
	
]

{ #category : #tests }
SoupParserTest >> testTextArea [
	| soup |
	soup := Soup fromString: '<textarea><b>This is an example of an HTML tag</b><&<&</textarea>'.
	self assert: soup textarea string = '<b>This is an example of an HTML tag</b><&<&'
]

{ #category : #tests }
SoupParserTest >> testWhitespaceInDeclaration [
	self 
		assertSoupFrom: '<! DOCTYPE>'
		printsAs: '<!DOCTYPE>'
]

{ #category : #tests }
SoupParserTest >> todotestNonBreakingSpaces [

	self halt.

]
