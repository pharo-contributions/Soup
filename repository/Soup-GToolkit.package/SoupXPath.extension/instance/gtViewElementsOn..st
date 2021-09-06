*Soup-GToolkit
gtViewElementsOn: aView
	<gtView>

	(self isEmpty) ifTrue: [ ^ aView empty ].
	^ aView tree
		title: 'Elements' translated;
		priority: 25;
		items: [ self ];
		children: #children.