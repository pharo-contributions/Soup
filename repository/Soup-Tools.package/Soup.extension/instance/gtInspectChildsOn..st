*Soup-Tools-Inspector
gtInspectChildsOn: composite
	<gtInspectorPresentationOrder: 0>  
	
	^(composite tree)	 
			shouldValidate: false;
			title: 'Children';
			display: [ children ];
			children: [ :each | 
					each isTag 
							ifTrue: [ each children 	] 
							ifFalse: [#()] ];
			format: [:each | 
					each isTag 
							ifTrue: [ each name ]
						   ifFalse: [ each printString ] ]