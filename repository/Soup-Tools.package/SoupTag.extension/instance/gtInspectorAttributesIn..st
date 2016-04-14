*Soup-Tools-Inspector
gtInspectorAttributesIn: composite
	<gtInspectorPresentationOrder: 6>  
	
	^(composite table)	 
		title: 'Attributes';
		display: [:each | attributes associations ];
		column: 'Key' evaluated: #key;
		column: 'Value' evaluated: #value.