accessing
sniffEncoding
	| xmlEncodingMatcher |
	xmlEncodingMatcher := '^<\?.*encoding=[''"](.*?)[''"].*\?>' asRegex.
	(xmlEncodingMatcher matches: xmlData)
		ifTrue: [
  			xmlEncoding = (xmlEncodingMatcher subexpression: 1) asLowercase.
			(sniffedXmlEncoding notNil and: [
				#('iso-10646-ucs-2' 'ucs-2' 'csunicode'
				'iso-10646-ucs-4' 'ucs-4' 'csucs4'
				'utf-16' 'utf-32' 'utf_16' 'utf_32'
				'utf16' 'u16') includes: xmlEncoding
		]) ifTrue: [xmlEncoding := sniffedXmlEncoding]
	].
