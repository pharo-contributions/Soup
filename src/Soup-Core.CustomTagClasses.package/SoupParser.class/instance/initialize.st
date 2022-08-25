initializing
initialize
	super initialize.
	interesting := '[&<]' asRegex.
	startTagOpen := '<[>a-zA-Z]' asRegex.
	charRef := '&#([0-9]+)[^0-9]' asRegex.
	entityRef := '&([a-zA-Z][-.a-zA-Z0-9]*)[^a-zA-Z0-9]' asRegex.
	endBracket := '[<>]' asRegex.
	tagFind := '[a-zA-Z][-_.a-zA-Z0-9:]*' asRegex.
	attrFind := '\s*([a-zA-Z_][-:.a-zA-Z_0-9]*)(\s*=\s*(''[^'']*''|"[^"]*"|[\-a-zA-Z0-9./,:;+*%?!&$()_#=~''"@]*))?' asRegex.
	incomplete := '&([a-zA-Z][a-zA-Z0-9]*|#[0-9]*)?|<([a-zA-Z][^<>]*|/([a-zA-Z][^<>]*)?|![^<>]*)?' asRegex.
	refFind := '&(([a-zA-Z][-.a-zA-Z0-9]*)|#(\w+))(;)?' asRegex.	