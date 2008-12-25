as yet unclassified
reset
	currentData := ReadWriteStream on: String new.
	currentTag := nil.
	tagStack := OrderedCollection new.
	quoteStack := OrderedCollection new.
	literal := false.
	self pushTag: self createRootTag