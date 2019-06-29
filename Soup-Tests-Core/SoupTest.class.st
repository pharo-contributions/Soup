Class {
	#name : #SoupTest,
	#superclass : #TestCase,
	#category : #'Soup-Tests-Core'
}

{ #category : #'tests-instance creation' }
SoupTest >> testFromString [

	| soup |
	soup := Soup fromString: '<html><head><title>Page title</title></head><body><p id="firstpara" align="center">This is paragraph <b>one</b><p id="secondpara" align="blah">This is paragraph <b>two</b></html>'.
	self assert: soup html head title text equals: 'Page title'.
]

{ #category : #'tests-instance creation' }
SoupTest >> testFromUrl [
	"Note: if Zinc is present, a ZnUrl can also be passed as an argument to #fromUrl: if Soup-Zinc is loaded"

	| soup urlString url |
	urlString := 'http://www.google.com'.
	url := urlString asUrl.
	[
		soup := Soup fromUrl: urlString.
		self deny: (soup findTag: #html) isNil.
		
		soup := Soup fromUrl: url.
		self deny: (soup findTag: #html) isNil ]
		on: NameLookupFailure
		do: [ self error: 'Can''t reach google to perform test' ].
]
