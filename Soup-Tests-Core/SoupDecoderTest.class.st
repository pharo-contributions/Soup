Class {
	#name : #SoupDecoderTest,
	#superclass : #TestCase,
	#category : #'Soup-Tests-Core'
}

{ #category : #'as yet unclassified' }
SoupDecoderTest >> testSmartQuotesNotSoSmartAnymore [
	"self debug: #testSmartQuotesNotSoSmartAnymore"
	| decoder |
	decoder := SoupDecoder new.
	decoder convertSmartQuotesToHtml.
	decoder string: ('{1}Foo{2} <!-- blah -->' format: (#(145 146) collect: [:e | e asCharacter])).
	self assert: (decoder decode = '&lsquo;Foo&rsquo; <!-- blah -->')
]
