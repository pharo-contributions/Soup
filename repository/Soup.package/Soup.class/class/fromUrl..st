instance creation
fromUrl: aString
	^ self fromString: (HTTPClient httpGet: aString) contents
