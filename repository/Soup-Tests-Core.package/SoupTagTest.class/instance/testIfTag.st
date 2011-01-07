testing
testIfTag
	"ifTag: executes its block argument when the receiver is a tag."
	
	| tag |
	tag := SoupTag new.
	tag ifTag: [^ self].
	self fail