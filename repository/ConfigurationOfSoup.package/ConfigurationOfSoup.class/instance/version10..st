version
version10: spec 
	<version: '1.0' imports:  #('1.0-baseline')>
	 
	spec for: #pharo do: [
		spec blessing: #development. 		
		spec 
			project: 'XMLSupport' 
			with: [spec 
					loads: #('XML-Parser' 'XML-Tests-Parser'); 
					versionString: '1.2.0'].
	
		spec 
			package: 'Soup-Core' with: 'Soup-Core-sd.11'; 
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-sd.3';
			package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.2' ].