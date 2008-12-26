initializing (html)
initializeResetNestingTagsForHtml
	resetNestingTags := Dictionary new.
	resetNestingTags 
		addAll: nestableBlockTags;
		addAll: nonNestableBlockTags;
		addAll: nestableListTags;
		addAll: nestableTags;
		at: #noscript put: #().
