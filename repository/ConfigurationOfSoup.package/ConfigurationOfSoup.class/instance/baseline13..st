baselines
baseline13: spec
	<version: '1.3-baseline'>
	spec
		for: #pharo
		do: [ 
			spec blessing: #baseline.
			spec description: 'Adding Camillo Bruni XPath extension'.
			spec author: 'StephaneDucasse'.
			spec timestamp: '31/12/2011 12:29'.
			spec repository: 'http://www.squeaksource.com/Soup'.
			spec
				package: 'Soup-Core' with: [ spec requires: 'XMLSupport' ];
				package: 'Soup-Tests-Core' with: [ spec requires: 'Soup-Core' ];
				package: 'Soup-Help' with: [ spec requires: 'Soup-Core' ];
				package: 'Soup-XPath' with: [ spec requires: 'Soup-Core' ].
			spec
				project: 'XMLSupport'
				with: [ 
					spec
						className: 'ConfigurationOfXMLSupport';
						versionString: #stable;
						repository: 'http://www.squeaksource.com/XMLSupport' ] ].
	spec
		for: #zinc
		do: [ 
			spec
				package: 'Soup-Zinc';
				package: 'Soup-Core' with: [ spec includes: 'Soup-Zinc' ] ]