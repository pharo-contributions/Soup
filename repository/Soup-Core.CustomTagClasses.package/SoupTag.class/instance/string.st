accessing
string
	"Return the string representation of the receiver if the receiver is not composed of subnodes."
	^ (children size = 1 and: [(children at: 1) isString])
				ifTrue: [(children at: 1) contents]
				ifFalse: [nil]