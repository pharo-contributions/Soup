tests
testNestedTables
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