instance creation
fromUrl: urlObject

	^ self fromString: urlObject asUrl retrieveContents.
