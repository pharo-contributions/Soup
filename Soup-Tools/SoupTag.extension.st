Extension { #name : #SoupTag }

{ #category : #'*Soup-Tools-Inspector' }
SoupTag >> gtInspectorAttributesIn: composite [
	<gtInspectorPresentationOrder: 6>  
	
	^(composite table)	 
		title: 'Attributes';
		display: [:each | attributes associations ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value.
]

{ #category : #'*Soup-Tools-Inspector' }
SoupTag >> gtInspectorContentsIn: composite [
	<gtInspectorPresentationOrder: 4> 
	composite text 
		title: 'Contents';
		display: [ :anObject | anObject asString ]				   
]
