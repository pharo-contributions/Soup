baselines
baseline10: spec
	<version: '1.0-baseline'>
	spec
		for: #pharo
		do: [ 
			spec blessing: #baseline.
			spec description: 'First Full Configuration'.
			spec author: 'StephaneDucasse'.
			spec timestamp: '29/12/2011 12:29'.
			spec repository: 'http://www.squeaksource.com/Soup'.
			spec
				package: 'Soup-Core' with: [ spec requires: 'XMLSupport' ];
				package: 'Soup-Tests-Core' with: [ spec requires: 'Soup-Core' ];
				package: 'Soup-Help' with: [ spec requires: 'Soup-Core' ].
			spec
				project: 'XMLSupport'
				with: [ 
					spec
						className: 'ConfigurationOfXMLSupport';
						versionString: #stable;
						repository: 'http://www.squeaksource.com/XMLSupport' ] ]