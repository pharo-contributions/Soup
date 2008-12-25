as yet unclassified
copy: aString replace: regexString using: aBlock
	| matcher |
	matcher := regexString asRegex.
	^ matcher copy: aString translatingMatchesUsing: [
		:matchString |
		" Pass the matcher as it has all the information we need 
		and we can always reconstruct the matched string. "
		aBlock value: matcher.
		]