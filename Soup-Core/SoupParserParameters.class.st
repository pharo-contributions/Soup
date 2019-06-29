"
Parameters that can be given to the parser
"
Class {
	#name : #SoupParserParameters,
	#superclass : #Object,
	#instVars : [
		'selfClosingTags',
		'nestableInlineTags',
		'nestableBlockTags',
		'nestableListTags',
		'nestableTableTags',
		'nestableTags',
		'nonNestableBlockTags',
		'resetNestingTags',
		'quoteTags',
		'entityDefinitions'
	],
	#classVars : [
		'ForHtml'
	],
	#category : #'Soup-Core-Parser'
}

{ #category : #defaults }
SoupParserParameters class >> forHtml [
	^ ForHtml ifNil: [
		ForHtml := self basicNew 
			initializeForHtml; 
			yourself
		]
]

{ #category : #defaults }
SoupParserParameters class >> reset [
	ForHtml := nil
]

{ #category : #accessing }
SoupParserParameters >> entityDefinitions [
	^ entityDefinitions
]

{ #category : #accessing }
SoupParserParameters >> entityDefs [
	^ entityDefs
]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeEntityDefinitionsForHtml [
	entityDefinitions := Dictionary newFrom: {
		'lt' -> '<'.
		'gt' -> '>'.
		'amp' -> '&'.	
		'quot' -> ''''.
		'apos' -> ''''.
	}

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeForHtml [
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

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeNestableBlockTagsForHtml [
	nestableBlockTags := Dictionary newFrom: {
		#blockquote -> #().
		#div -> #().
		#fieldset -> #().
		#ins -> #().
		#del -> #()
	}.

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeNestableInlineTagsForHtml [
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

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeNestableListTagsForHtml [
	nestableListTags := Dictionary newFrom: {
		#ol -> #().
		#ul -> #().
		#li -> #(ol ul).
		#dl -> #().
		#dd -> #(dl).
		#dt -> #(dl)
	}.

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeNestableTableTagsForHtml [
	nestableTableTags := Dictionary newFrom: {
		#table -> #().
		#tr -> #(table tbody tfoot thead).
		#td -> #(tr).
		#th -> #(td).
		#thead -> #(table).
		#tbody -> #(table).
		#tfoot -> #(table).
	}.

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeNestableTagsForHtml [
	nestableTags := Dictionary new.
	nestableTags
		addAll: nestableInlineTags;
		addAll: nestableBlockTags;
		addAll: nestableListTags;
		addAll: nestableTableTags.

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeNonNestableBlockTagsForHtml [
	nonNestableBlockTags := Dictionary newFrom: {
		#address -> #().
		#form -> #().
		#p -> #().
		#pre -> #().
	}.

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeQuoteTagsForHtml [
	quoteTags := #(script  textarea)

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeResetNestingTagsForHtml [
	resetNestingTags := Dictionary new.
	resetNestingTags 
		addAll: nestableBlockTags;
		addAll: nonNestableBlockTags;
		addAll: nestableListTags;
		addAll: nestableTags;
		at: #noscript put: #().

]

{ #category : #'initializing (html)' }
SoupParserParameters >> initializeSelfClosingTagsForHtml [
	selfClosingTags := #(br hr input img meta spacer link frame base).

]

{ #category : #accessing }
SoupParserParameters >> nestableTags [
	^ nestableTags
]

{ #category : #accessing }
SoupParserParameters >> quoteTags [
	^ quoteTags
]

{ #category : #accessing }
SoupParserParameters >> resetNestingTags [
	^ resetNestingTags 
]

{ #category : #accessing }
SoupParserParameters >> selfClosingTags [
	^ selfClosingTags
]
