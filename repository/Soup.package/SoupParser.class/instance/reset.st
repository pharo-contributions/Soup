initializing
reset
	currentData := ReadWriteStream on: String new.
	tagStack := OrderedCollection new.
	quoteStack := OrderedCollection new.
	literal := false.
	self pushTag: self createRootTag