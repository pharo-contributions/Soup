as yet unclassified
descendant: anObject
	^ SoupXPath streamContents: [ :stream| 
			self do: [ :tag|
				tag findAllTags: anObject stream: stream]].