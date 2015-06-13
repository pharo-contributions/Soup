initializing
beParentOf: anElement
	children ifNotEmpty: [anElement previousSibling: children last].
	children add: anElement.
	