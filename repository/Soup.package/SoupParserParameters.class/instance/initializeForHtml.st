as yet unclassified
initializeForHtml
	entityDefs := Dictionary new.
	entityDefs at: 'lt' put: '<'.
	entityDefs at: 'gt' put: '>'.
	entityDefs at: 'amp' put: '&'.	
	entityDefs at: 'quot' put: ''''.
	entityDefs at: 'apos' put: ''''.

	selfClosingTags := #(br hr input img meta spacer link frame base).
	
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
	nestableBlockTags := Dictionary newFrom: {
		#blockquote -> #().
		#div -> #().
		#fieldset -> #().
		#ins -> #().
		#del -> #()
	}.
	nestableListTags := Dictionary newFrom: {
		#ol -> #().
		#ul -> #().
		#li -> #(ol ul).
		#dl -> #().
		#dd -> #(dl).
		#dt -> #(dl)
	}.
	nestableTableTags := Dictionary newFrom: {
		#table -> #().
		#tr -> #(table tbody tfoot thead).
		#td -> #(tr).
		#th -> #(td).
		#thead -> #(table).
		#tbody -> #(table).
		#tfoot -> #(table).
	}.
	nestableTags := Dictionary new.
	nestableTags
		addAll: nestableInlineTags;
		addAll: nestableBlockTags;
		addAll: nestableListTags;
		addAll: nestableTableTags.

	nonNestableBlockTags := Dictionary newFrom: {
		#address -> #().
		#form -> #().
		#p -> #().
		#pre -> #().
	}.

	resetNestingTags := Dictionary new.
	resetNestingTags 
		addAll: nestableBlockTags;
		addAll: nonNestableBlockTags;
		addAll: nestableListTags;
		addAll: nestableTags;
		at: #noscript put: #().

	quoteTags := #(script  textarea)
