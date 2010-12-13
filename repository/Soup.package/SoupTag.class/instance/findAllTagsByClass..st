finding tags
findAllTagsByClass: aString 
	^ Array streamContents:  [ :aStream | 
				self 
					findAllTagsByClass: aString
					stream: aStream ]