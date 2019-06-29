Class {
	#name : #SoupTagTest,
	#superclass : #SoupElementTest,
	#category : #'Soup-Tests-Core'
}

{ #category : #accessing }
SoupTagTest >> testAddChild [
	| tag childOne childTwo |
	tag := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	tag addChild: childOne.
	self assert: (tag childAt: 1) = childOne.
	tag addChild: childTwo.
	self assert: (tag childAt: 1) = childOne.
	self assert: (tag childAt: 2) = childTwo.
	self should: [tag childAt: 3] raise: Error.
	
]

{ #category : #accessing }
SoupTagTest >> testAttributeAt [
	| tag |
	tag := SoupTag new.
	tag attributeAt: 'abc' put: 'def'.
	self assert: (tag attributeAt: 'abc') = 'def'.
	self should: (tag attributeAt: 'xyz') = nil
]

{ #category : #accessing }
SoupTagTest >> testAttributeAtPut [
	self testAttributeAt 
]

{ #category : #accessing }
SoupTagTest >> testAttributeAtifAbsent [
	| tag |
	tag := SoupTag new.
	tag attributeAt: 'abc' put: 'def'.
	tag attributeAt: 'abc' ifAbsent: [tag attributeAt: 'abc' put: 'asd'].
	tag attributeAt: 'xyz' ifAbsent: [tag attributeAt: 'xyz' put: 'asd'].
	self assert: ((tag attributeAt: 'abc') = 'def'). 
	self assert: ((tag attributeAt: 'xyz') = 'asd').
]

{ #category : #accessing }
SoupTagTest >> testBeParentOf [
	| parent childOne childTwo |
	parent := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	parent beParentOf: childOne.
	parent beParentOf: childTwo.
	self assert: childOne nextSibling = childTwo.
	self assert: childTwo previousSibling = childOne.
	parent childrenDo: [ :anElement |
		self assert: ({childOne. childTwo.} includes: anElement) ].
]

{ #category : #accessing }
SoupTagTest >> testBeSelfClosing [
	self testIsSelfClosing
]

{ #category : #accessing }
SoupTagTest >> testChildAt [
	self testAddChild
]

{ #category : #enumerating }
SoupTagTest >> testChildStringsDo [
	"self debug: #testChildStringsDo"
	"childStringsDo: evaluates a block only on leaves which are plain strings"
	| soup stringsRemaining | 
	soup := Soup fromString: '<p>xyz</p>abc<span>123</span><br/>def'.
	stringsRemaining := #(abc def) asOrderedCollection.
	soup childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	self assert: stringsRemaining isEmpty.
	
	stringsRemaining := #(xyz) asOrderedCollection.
	soup := Soup fromString: '<p>xyz</p>'.
	"While xyz was not considered as a string in the previous text, it is now one since we accessed it using message p."
	soup p childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	self assert: stringsRemaining isEmpty.
	
	stringsRemaining := #(xyz) asOrderedCollection.
	soup := Soup fromString: '<b>xyz</b>'.
	soup childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	"Here b is decorated so it is not iterated"
	self deny: stringsRemaining isEmpty.
	
	stringsRemaining := #(xyz) asOrderedCollection.
	soup := Soup fromString: '<b>xyz</b>'.
	"Here we access the string using the message b so it is iterated."
	soup b childStringsDo: 
				[ :aString |
				self assert: aString isString.
				stringsRemaining remove: aString contents ].
	self assert: stringsRemaining isEmpty.
	
	
]

{ #category : #enumerating }
SoupTagTest >> testChildTagsDo [
	| soup tagsRemaining | 
	soup := Soup fromString: '<p>abc</p><span>def</span><br/>'.
	tagsRemaining := #(p span br) asOrderedCollection.
	soup childTagsDo: [ :aTag |
		self assert: aTag isTag.
		tagsRemaining remove: aTag name ].
	self assert: tagsRemaining isEmpty
	
]

{ #category : #'finding strings' }
SoupTagTest >> testChildren [
	| soup tag|
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	tag := soup p.
	self assert: (tag children first contents = 'abcxyz').
	self assert: (tag children second = soup span).
]

{ #category : #enumerating }
SoupTagTest >> testChildrenDo [
	| tag childOne childTwo |
	tag := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	tag addChild: childOne.
	tag addChild: childTwo.
	tag childrenDo: [ :anElement |
		self assert: ({childOne. childTwo} includes: anElement) ].
]

{ #category : #enumerating }
SoupTagTest >> testChildrenDoWorksOnlyAtOneLevel [
	"self debug: #testChildrenDoWorksOnlyAtOneLevel"
	| fatherTag grandFatherTag childOne childTwo |
	grandFatherTag := SoupTag new.
	fatherTag := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	grandFatherTag addChild: fatherTag.
	fatherTag addChild: childOne.
	fatherTag addChild: childTwo.
	grandFatherTag childrenDo: [ :anElement |
		self deny: ({childOne. childTwo} includes: anElement) ].
	grandFatherTag childrenDo: [ :anElement |
		self assert: ({fatherTag} includes: anElement) ].
]

{ #category : #'error handling' }
SoupTagTest >> testDoesNotUnderstand [
	| soup body |
	soup := Soup fromString: '<body id="a"><p id="b">a<span>b</span><br/>'.
	body := soup findTag: 'body'.
	self assert: body id = 'a'.
	self assert: body p id = 'b'.
	self assert: body br name = 'br'.
	self assert: body missing isNil.
	self should: [body test: 1] raise: MessageNotUnderstood 
]

{ #category : #'finding strings' }
SoupTagTest >> testFindAllStrings [
	"self run: #testFindAllStrings"
	"Returns all the strings equal to the argument. Note that the argument can be a regex to match several elements." 
	
	| soup |
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	self assert: ((soup findAllStrings: 'abcd') size = 1).
	self assert: ((soup findAllStrings: 'abc' asRegex) size = 3).


]

{ #category : #'finding strings' }
SoupTagTest >> testFindAllStringsWithLargerTree [
	"self run: #testFindAllStringsWithLargerTree"
	"Returns all the strings equal to the argument. Note that the argument can be a regex to match several elements." 
	
	| soup |
	soup := Soup fromString: '<p>abc<span>def</span></p><b>abcdef<span>defi</span><span>defi2</span></b><p>abc3<span>def</span></p>'.
	self assert: ((soup findAllStrings: 'abcdef' asRegex) size = 1).
	self assert: ((soup findAllStrings: 'abc3') size = 1).
	self assert: ((soup findAllStrings: 'abc' asRegex) size = 3).


]

{ #category : #'finding tags' }
SoupTagTest >> testFindAllTags [
	| soup |
	soup := Soup fromString: '<body><p>abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	soup findAllTags: [:e | self assert: e isTag. true].
	self assert: (soup findAllTags: [:e | true]) size = 5.
	self assert: (soup findAllTags: [:e | false]) size = 0.	

]

{ #category : #'finding tags' }
SoupTagTest >> testFindAllTagsByClass [
	
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

]

{ #category : #'finding strings' }
SoupTagTest >> testFindChildString [
	| soup tag|
	soup := Soup fromString: '<p>abcxyz<span>abcd</span>abc</p>'.
	tag := soup p.
	self assert: ((tag findChildString: 'abc') contents = 'abc').
	self assert: ((tag findChildString: 'abcxyz') contents = 'abcxyz').
	self assert: ((tag findChildString: 'ab') = nil).
]

{ #category : #'finding strings' }
SoupTagTest >> testFindString [
	| soup tag |
	soup := Soup fromString: '<p>abc<span>def</span></p>'.
	tag := soup p.
	self assert: (tag findString: 'def') contents = 'def'.
	self assert: (tag findString: #('def')) contents = 'def'.
	self assert: (tag findString: 'def' asRegex) contents = 'def'.

]

{ #category : #'finding strings' }
SoupTagTest >> testFindString2 [
	<publicTest>
	<systemHelp>
	
	| soup tag |
	"Now we build a soup element with two branches containing different strings."
	soup := Soup fromString: '<p>abc<span>def</span></p><b>abcdef<span>defi</span><span>defi2</span></b>'.
	
	"We are accessing the first nodes being a paragraph"
	tag := soup p.
	
	"Now we can check that the string 'def' is found either directly or among a list of elements to be found, or using a regex"
	self assert: (tag findString: 'def') contents = 'def'.
	self assert: (tag findString: #('def')) contents = 'def'.
	self assert: (tag findString: 'def' asRegex) contents = 'def'.
	
	"Now we progress and query the b element"
	tag := soup b.
	
	"This branch does not contain a 'def' string so it returns nil"
	self assert: (tag findString: 'def') isNil.
		"IMplementation note: returning nil is suboptimal"
	
	"still we can find other string elements using the same api than above"	
	self assert: (tag findString: 'defi') contents = 'defi'.
	self assert: (tag findString: #('defi' 'defi2')) contents = 'defi'.
	"we get the first occurrence here defi"
	
	"We get now the first occurrence matching the regex"
	self assert: (tag findString: '.def' asRegex) contents = 'abcdef'.
	
]

{ #category : #'finding strings' }
SoupTagTest >> testFindStringifPresent [
	| soup tag found|
	soup := Soup fromString: '<p>abc<span>def</span></p>'.
	tag := soup p.
	found := nil.
	tag findString: 'def' ifPresent: [:aString | found := aString].
	self assert: (found contents = 'def'). 
	self assert: (found isString).
	tag findString: 'def' asRegex ifPresent: [:aString | found := aString ].
	self assert: (found contents = 'def').

]

{ #category : #'finding tags' }
SoupTagTest >> testFindTag [
	
	| soup body |
	soup := Soup fromString: '<body><p>abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	body := soup body.
	self assert: (body findTag: 'p') name = 'p'.
	self assert: (body findTag: #(p br)) name = 'p'.
	self assert: (body findTag: [:aTag | aTag name = 'br']) id = '1'.
	self assert: (body findTag: [:aTag | aTag id = '2']) name = 'br'.
	self assert: (body span) name = 'span'

]

{ #category : #'finding tags' }
SoupTagTest >> testFindTagIfPresent [
	| soup body found |
	soup := Soup fromString: '<body><p>abc<br id="1"/>def<br id="2"/><span class="c">xyz</span></p></body>'.
	body := soup body.
	body findTag: 'foo' ifPresent: [self fail].
	body findTag: #(foo bar) ifPresent: [self fail].
	body findTag: [:aTag | aTag name = 'foo'] ifPresent: [self fail].
	body findTag: [:aTag | aTag id = 'bar'] ifPresent: [self fail].
	found := nil.
	body findTag: 'span' ifPresent: [:aTag | found := aTag].
	self assert: (found attributeAt: 'class') = 'c'.
	found := nil.
	body findTag: #(span) ifPresent: [:aTag | found := aTag].
	self assert: (found attributeAt: 'class') = 'c'.
	found := nil.
	body findTag: [:aTag | aTag name = 'span'] ifPresent: [:aTag | found := aTag].
	self assert: (found attributeAt: 'class') = 'c'.
	found := nil.
	body findTag: [:aTag | aTag id = '2'] ifPresent: [:aTag | found := aTag].
	self assert: found name = 'br'
	
]

{ #category : #'error handling' }
SoupTagTest >> testHasAttributes [
	| soup body span|
	soup := Soup fromString: '<body id="a"><p id="b">a<span>b</span><br/>'.
	body := soup findTag: 'body'.
	span := soup findTag: 'span'.
	self assert: (body hasAttributes).
	self assert: (span hasAttributes = false).
]

{ #category : #testing }
SoupTagTest >> testIfTag [
	"ifTag: executes its block argument when the receiver is a tag."
	
	| tag |
	tag := SoupTag new.
	tag ifTag: [^ self].
	self fail
]

{ #category : #testing }
SoupTagTest >> testIsSelfClosing [
	| tag |
	tag := SoupTag new.
	self assert: tag isSelfClosing not.
	tag beSelfClosing.
	self assert: tag isSelfClosing.
	
]

{ #category : #testing }
SoupTagTest >> testIsTag [
	| tag |
	tag := SoupTag new.
	self assert: tag isTag.
	
]

{ #category : #accessing }
SoupTagTest >> testName [
	| tag |
	tag := SoupTag new.
	tag name: 'abc'.
	self assert: tag name = 'abc'
]

{ #category : #printing }
SoupTagTest >> testPrintOn [
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
	
	
]

{ #category : #accessing }
SoupTagTest >> testSize [
	"The size of an element is its number of direct children"
	"self debug: #testSize"
	| soup doc|
	soup := Soup fromString: '<top>1<b>2</b>3</top><hr/>'.
	self assert: (soup size = 2).
	
	doc := '<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>'.
	soup := Soup fromString: doc.
	self assert: soup size = 1.
	"<html> ....</html> is one node"
	self assert: soup html size = 2.
	"inside we get <head> and <body>..."
	
]

{ #category : #accessing }
SoupTagTest >> testSizeContainingSquareBrackets [
	"The size of an element is its number of direct children"
	"self debug: #testSizeContainingSquareBrackets"
	| doc |
	doc := '[''<html><head><title>Page title</title></head> 
				<body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	(Soup fromString: doc ) size = 3.
	"The document is composed of [ ] and the <...>"
]

{ #category : #accessing }
SoupTagTest >> testString [
	"self debug: #testString"
	| soup |
	soup := Soup fromString: '<b>foo</b>'.
	self assert: (soup b string = 'foo').
	
	"if the element is composed of subnodes return nil"
	soup := Soup fromString: '<b>f<i>e</i>o</b>'.
	self assert: (soup b string) isNil.
	
	soup := Soup fromString: '<b>foo</b><b>bar</b>'.
	self assert: (soup b string = 'foo').
	self assert: (soup b nextSibling string = 'bar').
	
]
