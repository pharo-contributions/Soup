as yet unclassified
parseEntityRef: anInteger
	| name i |
	name := entityRef subexpression: 2.
	self handleEntityRef: name.
	i := entityRef subEnd: 2.
	^ i + 1