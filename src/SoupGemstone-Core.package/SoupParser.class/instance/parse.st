parsing
parse
	| position end |
	position := 0.
	end := string size.
	[position < end] whileTrue: [
		position := self parseAny: position.
		position < 0 ifTrue: [^ self]
	]
