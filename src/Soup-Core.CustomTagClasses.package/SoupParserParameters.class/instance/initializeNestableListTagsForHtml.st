initializing (html)
initializeNestableListTagsForHtml
	nestableListTags := Dictionary newFrom: {
		#ol -> #().
		#ul -> #().
		#li -> #(ol ul).
		#dl -> #().
		#dd -> #(dl).
		#dt -> #(dl)
	}.
