filtering
descendant: anObject

	^ self class streamContents: [ :stream| 
			self do: [ :tag|
				tag findAllTags: anObject stream: stream]].