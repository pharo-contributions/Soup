baselines
baseline10: spec 

	<version: '1.0'> 
	spec for: #pharo do: [ 
		spec blessing: #baseline.
		spec description: 'First Full Configuration'. 
		spec author: 'StephaneDucasse'.
		spec timestamp: '29/12/2011 12:29'.
		
		spec project: 'XMLSupport' with: [
			spec className: 'ConfigurationOfXMLSupport';
			versionString: #stable;
			repository: 'http://www.squeaksource.com/XMLSupport'.
			]
		
		]
	