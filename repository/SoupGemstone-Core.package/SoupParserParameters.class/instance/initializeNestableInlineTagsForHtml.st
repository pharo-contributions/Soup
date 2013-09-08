initializing (html)
initializeNestableInlineTagsForHtml
	nestableInlineTags := Dictionary newFrom: {
		#span -> #().
		#font -> #().
		#q -> #().
		#object -> #().
		#bdo -> #().
		#sub -> #().
		#sup -> #().
		#center -> #()
	}.
