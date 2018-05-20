initializing (html)
initializeNestableBlockTagsForHtml
	nestableBlockTags := Dictionary newFrom: {
		#blockquote -> #().
		#del -> #().
		#div -> #().
		#fieldset -> #().
		#header -> #(). "https://www.w3schools.com/tags/tag_header.asp"
		#ins -> #().
		#pre -> #().
		#section -> #(). "https://www.w3schools.com/tags/tag_section.asps"
	}.
