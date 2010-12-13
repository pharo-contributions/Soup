printing
testPrintOn
	| tag |
	tag := SoupTag named: 'p'.
	self assert: tag printString = '<p></p>'.
	tag attributeAt: 'id' put: 'a'.
	self assert: tag printString = '<p id="a"></p>'.
	tag attributeAt: 'class' put: 'b'.	
	self assert: tag printString = '<p class="b" id="a"></p>'.
	tag addChild: (SoupTag named: 'span').
	self assert: tag printString = '<p class="b" id="a"><span></span></p>'.
	(tag childAt: 1) addChild: (SoupString new contents: 'abc'; yourself).
	self assert: tag printString = '<p class="b" id="a"><span>abc</span></p>'.
	tag addChild: (SoupTag named: 'br') beSelfClosing; yourself.
	self assert: tag printString = '<p class="b" id="a"><span>abc</span><br /></p>'.		
	
	