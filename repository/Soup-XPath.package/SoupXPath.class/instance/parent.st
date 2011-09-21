filtering
parent

	|parents|
	
	parents := Set new.
	
	self do: [ :tag| parents add: tag parent ].
	
	^ SoupXPath withAll: parents.