filtering
attribute: attributeName matching: aRegex

	^ self select: [ :tag| 
			(tag hasAttribute: attributeName) and: [ aRegex matches: tag @ attributeName ]]