accessing
sniffNonAsciiCompatibleEncoding

	(self stringStartsWith: '\x4c\x6f\xa7\x94')
		ifTrue: [
	  		sniffedXmlEncoding := nil.
			^ xmlData := self convertEbcdicToAscii: string.
		].
	(self stringStartsWith: '\x00\x3c\x00\x3f')
		ifTrue: [
			sniffedXmlEncoding := 'utf-16be'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	((string size >= 4) 
		and: [(self stringStartsWith: '\xfe\xff') 
			and: [(self stringStartsWith: '\xfe\xff\x00\x00') not]])
		ifTrue: [
			sniffedXmlEncoding := 'utf-16be'.
			^ xmlData := ((string copyFrom: 3 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x3c\x00\x3f\x00')
		ifTrue: [
			sniffedXmlEncoding := 'utf-16le'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	((string size >= 4) 
		and: [(self stringStartsWith: '\xff\xfe') 
			and: [(self stringStartsWith: '\xff\xfe\x00\x00') not]])
		ifTrue: [
			sniffedXmlEncoding := 'utf-16le'.
			^ xmlData := ((string copyFrom: 3 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x00\x00\x00\x3c')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32be'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x3c\x00\x00\x00')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32le'.
			^ xmlData := (string convertFromEncoding: sniffedXmlEncoding) 
				convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\x00\x00\xfe\xff')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32be'.
			^ xmlData := ((string copyFrom: 5 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\xff\xfe\x00\x00')
		ifTrue: [
			sniffedXmlEncoding := 'utf-32le'.
			^ xmlData := ((string copyFrom: 5 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	(self stringStartsWith: '\xef\xbb\xbf')
		ifTrue: [
			sniffedXmlEncoding := 'utf-8'.
			^ xmlData := ((string copyFrom: 4 to: string size) 
				convertFromEncoding: sniffedXmlEncoding) 
					convertToEncoding: 'utf-8'
		].
	sniffedXmlEncoding := 'latin1'
