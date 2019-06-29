Class {
	#name : #SoupElementTest,
	#superclass : #TestCase,
	#category : #'Soup-Tests-Core'
}

{ #category : #accessing }
SoupElementTest >> testAccessingText [
	"The method text returns all the texts elements contained"
	"self debug: #testAccessingText"

	| doc |
	doc := '[''<html><head><title>Page title</title></head> <body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>]'.
	self assert: (Soup fromString: doc ) text = '[''Page title This is paragraph oneThis is paragraph two]' 
]

{ #category : #'finding tags' }
SoupElementTest >> testAttributeAtifAbsent [
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'abc'.
	b attributeAt: 'asd' ifAbsent: [b attributeAt: 'asd' put: 'def'].
	self assert: (b attributeAt: 'asd') = nil.

	
]

{ #category : #'finding tags' }
SoupElementTest >> testAttributeAtput [
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'abc'.
	b attributeAt: 'asd' put: 'def'.
	self assert: (b attributeAt: 'asd') = nil.

	
]

{ #category : #'finding tags' }
SoupElementTest >> testFindChildString [
	| soup b | 
	soup := Soup fromString: '<b id="1">def<b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'def'.
	self assert: ((b findChildString: 'abc') = nil).
]

{ #category : #'finding tags' }
SoupElementTest >> testFindChildTag [
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'abc'.
	self assert: ((b findChildTag: 'b') = nil).

]

{ #category : #'finding strings' }
SoupElementTest >> testFindNextSiblingString [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><hr/>abc<br/>def<hr/><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingString: true) contents = 'abc'


]

{ #category : #'finding strings' }
SoupElementTest >> testFindNextSiblingStrings [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote>abc<br/>def<blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingStrings: true) size = 2.


]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextSiblingTag [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote>abc<blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingTag: true) id = '3'.
	self assert: (b findNextSiblingTag: [:e | e id = '4']) id = '4'.
	self assert: (b findNextSiblingTag: [:e | e id = '5']) = nil


]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextSiblingTags [
	"self debug: #testFindNextSiblingTags"
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingTags: true) size = 2.
	"Two because we get the node 3 (with the subnode 3.1 and the node 4"
	self assert: (b findNextSiblingTags: [:e | e id = '4']) size = 1.
	
]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextSiblingVersusFindTags [
	"self debug: #testFindNextSiblingVersusFindTags"
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextSiblingTags: [:e | '3*' match: e id]) size = 1.
	"here we see the difference between siblings and not. There are two nodes
	matching the id 3. 3 and 3.1 but they are not on the same level."
	self assert: (b findNextTags: [:e | '3*' match: e id]) size = 2.
]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextString [
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextString: true) contents = 'abc'.

	
]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextStrings [
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findTag: [:e | e name = 'b' and: [e id = '2']].
	self assert: (b findNextStrings: true) size = 2.


]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextTag [
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e id = '2'].
	self assert: (b findNextTag: 'b') id = '3'.

	
]

{ #category : #'finding tags' }
SoupElementTest >> testFindNextTags [
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e name = 'b' and: [e id = '2']].
	self assert: (b findNextTags: 'b') size = 2.
	self assert: (b findNextTags: [:e | e name = 'b' and: [e id = '4']]) size = 1.

]

{ #category : #'finding strings' }
SoupElementTest >> testFindPreviousSiblingString [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote>abc<br/>def<blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousSiblingString: true) contents = 'def'


]

{ #category : #'finding strings' }
SoupElementTest >> testFindPreviousSiblingStrings [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote>abc<br/>def<blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousSiblingStrings: true) size = 2.


]

{ #category : #'finding tags' }
SoupElementTest >> testFindPreviousSiblingTag [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousSiblingTag: true) id = '2'


]

{ #category : #'finding tags' }
SoupElementTest >> testFindPreviousSiblingTags [
	| soup b | 
	soup := Soup fromString: '<blockquote id="1"><blockquote id="1.1"></blockquote></blockquote><blockquote id="2"><blockquote id="2.1"></blockquote></blockquote><blockquote id="3"><blockquote id="3.1"></blockquote></blockquote><blockquote id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousSiblingTags: true) size = 2.
	self assert: (b findPreviousSiblingTags: [:e | e id = '1']) size = 1.

]

{ #category : #'finding tags' }
SoupElementTest >> testFindPreviousString [
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousString: true) contents = 'abc'.

	
]

{ #category : #'finding tags' }
SoupElementTest >> testFindPreviousStrings [
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">def<br/>abc<hr/></b><b id="3"><b id="4">'.
	b := soup findTag: 'hr'.
	self assert: (b findPreviousStrings: true) size = 2.


]

{ #category : #'finding tags' }
SoupElementTest >> testFindPreviousTag [
	| soup b |
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e id = '3'].
	self assert: (b findPreviousTag: 'b') id = '2'.

	
]

{ #category : #'finding tags' }
SoupElementTest >> testFindPreviousTags [
	| soup b | 
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3"><b id="4">'.
	b := soup findTag: [:e | e name = 'b' and: [e id = '3']].
	self assert: (b findPreviousTags: 'b') size = 2.
	self assert: (b findPreviousTags: [:e | e name = 'b' and: [e id = '1']]) size = 1.

]

{ #category : #'finding tags' }
SoupElementTest >> testHasAttributes [
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findString: 'def'.
	self assert: (b hasAttributes = false).
	self assert: (c hasAttributes = false).

	
]

{ #category : #'finding tags' }
SoupElementTest >> testIs [
	| soup b | 
	soup := Soup fromString: '<b id="1">def<b id="2">abc<b id="3"><b id="4">'.
	b := soup findString: 'def'.
	self assert: (soup isCData = false).
	self assert: (soup isComment = false).
	self assert: (soup isDeclaration = false).
]

{ #category : #'finding tags' }
SoupElementTest >> testNext [
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findTag: [:e | e id = '2'].
	b next: (SoupTag new name: 'newTag').
	c next: SoupTag new.
	c next attributeAt: 'at' put: 'newAt'.
	self assert: (b next isTag).
	self assert: (b next name = 'newTag').
	self assert: (c next hasAttributes).
	self assert: ((c next attributeAt: 'at') = 'newAt').

	
]

{ #category : #'finding tags' }
SoupElementTest >> testNextSibling [
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findTag: [:e | e id = '2'].
	b nextSibling: (SoupTag new name: 'newTag').
	c nextSibling: SoupTag new.
	c nextSibling attributeAt: 'at' put: 'newAt'.
	self assert: (b nextSibling isTag).
	self assert: (b nextSibling name = 'newTag').
	self assert: (c nextSibling hasAttributes).
	self assert: ((c nextSibling attributeAt: 'at') = 'newAt').

	
]

{ #category : #'finding tags' }
SoupElementTest >> testPrevious [
	| soup b c|
	soup := Soup fromString: '<b id="1"><b id="2">abc<b id="3">def<b id="4">'.
	b := soup findString: 'abc'.
	c := soup findTag: [:e | e id = '2'].
	b previous: (SoupTag new name: 'newTag').
	c previous: SoupTag new.
	c previous attributeAt: 'at' put: 'newAt'.
	self assert: (b previous isTag).
	self assert: (b previous name = 'newTag').
	self assert: (c previous hasAttributes).
	self assert: ((c previous attributeAt: 'at') = 'newAt').

	
]
