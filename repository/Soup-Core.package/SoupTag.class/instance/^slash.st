finding tags
/ anObject
	^ SoupXPath withAll: (self findAllChildTags: anObject)