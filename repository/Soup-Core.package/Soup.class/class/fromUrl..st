instance creation
fromUrl: aString
	Transcript show: aString; cr; flush.
	^ self fromString: (HTTPClient httpGet: aString) contents
