testing
testIfTag
	| tag |
	tag := SoupTag new.
	tag ifTag: [^ self].
	self fail