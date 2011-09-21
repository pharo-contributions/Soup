as yet unclassified
ancestor
	|ancestors ancestor|
	
	ancestors := Set new.
	
	self do: [ :tag|
		ancestor := tag. 
		[ancestor := ancestor parent] whileNotNil: [ ancestors add: ancestor ]].
	
	^ SoupXPath withAll: ancestors.