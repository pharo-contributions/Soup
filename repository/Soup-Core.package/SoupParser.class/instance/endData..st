handling
endData: aClass
	| data dataWithoutSeparators element |
	(currentData size = 0) ifTrue: [^ self].
	data := currentData contents.
	dataWithoutSeparators := data reject: [:aChar | aChar isSeparator].
	dataWithoutSeparators 
		ifEmpty: [
			data := (data includes: Character cr)
				ifTrue: [String cr]
				ifFalse: [' ']
		].
	currentData := ReadWriteStream on: String new.
	element := aClass parent: tagStack last previous: previous contents: data.
	previous := element.
	 