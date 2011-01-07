parsing
decode
	| decoder |
	decoder := SoupDecoder new.
	decoder convertSmartQuotesToHtml.
	decoder string: string.
	string := decoder decode.