initializing (html)
initializeNestableBlockTagsForHtml
	nestableBlockTags := Dictionary newFrom: {
		#blockquote -> #().
		#div -> #().
		#fieldset -> #().
		#ins -> #().
		#del -> #()
	}.
