massaging
copy: aString replace: regexStringOrMatcher using: aBlock
	| matcher |
	matcher := regexStringOrMatcher isMatcher
		ifTrue: [regexStringOrMatcher]
		ifFalse: [regexStringOrMatcher asRegex].
	^ matcher copy: aString translatingMatchesUsing: [
		:matchString |
		" Pass the matcher as it has all the information we need 
		and we can always reconstruct the matched string. "
		aBlock value: matcher.
		]