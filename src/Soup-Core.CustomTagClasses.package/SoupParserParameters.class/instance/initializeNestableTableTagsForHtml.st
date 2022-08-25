initializing (html)
initializeNestableTableTagsForHtml
	nestableTableTags := Dictionary newFrom: {
		#table -> #().
		#tr -> #(table tbody tfoot thead).
		#td -> #(tr).
		#th -> #(td).
		#thead -> #(table).
		#tbody -> #(table).
		#tfoot -> #(table).
	}.
