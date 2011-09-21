as yet unclassified
child: anObject
	^ SoupXPath streamContents: [ :stream| 
			self do: [ :tag|
				tag findAllChildTags: anObject stream: stream]].