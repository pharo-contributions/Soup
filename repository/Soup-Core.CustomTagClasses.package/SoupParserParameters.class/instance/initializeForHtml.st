initializing (html)
initializeForHtml
	self initializeEntityDefinitionsForHtml.
	self initializeSelfClosingTagsForHtml.
	self initializeNestableInlineTagsForHtml.
	self initializeNestableBlockTagsForHtml.
	self initializeNestableListTagsForHtml.
	self initializeNestableTableTagsForHtml.
	self initializeNestableTagsForHtml.
	self initializeNonNestableBlockTagsForHtml.
	self initializeResetNestingTagsForHtml.
	self initializeQuoteTagsForHtml.
