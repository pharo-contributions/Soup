as yet unclassified
smartPop: aString
	| nestingResetTriggers isNestable isResetNesting |
	nestingResetTriggers := parameters nestableTags at: aString ifAbsent: [nil].
	isNestable := nestingResetTriggers notNil.
	isResetNesting := parameters resetNestingTags includesKey: aString.
	tagStack reverseDo: [
		:aTag |
		((aTag isNil or: [aString = aTag name]) and: [isNestable not])
			ifTrue: [^ self popToTag: aString inclusive: true]
			ifFalse: [
				((nestingResetTriggers notNil 
					and: [nestingResetTriggers includes: aTag name]) 
				or: [nestingResetTriggers isNil 
					and: [isResetNesting 
						and: [parameters resetNestingTags includesKey: aTag name]]]) 
				ifTrue: [^ self popToTag: aTag name inclusive: false]
			]
	]