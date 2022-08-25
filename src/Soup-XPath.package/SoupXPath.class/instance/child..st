filtering
child: anObject

	^ self class streamContents: [ :stream| 
			self do: [ :tag|
				tag findAllChildTags: anObject stream: stream]].