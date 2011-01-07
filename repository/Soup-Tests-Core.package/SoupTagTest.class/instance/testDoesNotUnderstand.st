error handling
testDoesNotUnderstand
	| soup body |
	soup := Soup fromString: '<body id="a"><p id="b">a<span>b</span><br/>'.
	body := soup findTag: 'body'.
	self assert: body id = 'a'.
	self assert: body p id = 'b'.
	self assert: body br name = 'br'.
	self assert: body missing isNil.
	self should: [body test: 1] raise: MessageNotUnderstood 