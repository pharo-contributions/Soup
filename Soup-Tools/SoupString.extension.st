Extension { #name : #SoupString }

{ #category : #'*Soup-Tools-Inspector' }
SoupString >> gtInspectorTextIn: composite [
	<gtInspectorPresentationOrder: 0>
	 
	composite text 
		title: 'Text';
		display: [ :anObject | anObject text ]	
]
