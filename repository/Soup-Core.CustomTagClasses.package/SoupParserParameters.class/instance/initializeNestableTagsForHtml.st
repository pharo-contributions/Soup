initializing (html)
initializeNestableTagsForHtml
	nestableTags := Dictionary new.
	nestableTags
		addAll: nestableInlineTags;
		addAll: nestableBlockTags;
		addAll: nestableListTags;
		addAll: nestableTableTags.
