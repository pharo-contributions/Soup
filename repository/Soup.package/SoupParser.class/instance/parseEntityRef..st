parsing
parseEntityRef: anInteger
	self handleEntityRef: (entityRef subexpression: 2).
	^ ((entityRef subEnd: 2) first) + 1
