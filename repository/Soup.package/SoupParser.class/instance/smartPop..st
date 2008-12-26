handling
smartPop: aString
	tagStack reverseDo: [
		:aTag |
		| nestingResetTriggers |
		((aTag isNil or: [aString = aTag name]) and: [(self isNestable: aString) not])
			ifTrue: [^ self popToTag: aString inclusive: true].
		nestingResetTriggers := parameters nestableTags at: aString ifAbsent: [#()].
		((nestingResetTriggers includes: aTag name) 
			or: [nestingResetTriggers isEmpty 
				and: [(self isResetNesting: aString) 
					and: [self isResetNesting: aTag name]]])
			ifTrue: [^ self popToTag: aTag name inclusive: false]
	]