tests-instance creation
testFromUrl
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