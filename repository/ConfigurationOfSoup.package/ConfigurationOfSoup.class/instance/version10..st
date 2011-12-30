version
version10: spec 

	<version: '0.1'> 
	spec for: #pharo do: [
	spec blessing: #development. 		
	spec project: 'XMLSupport' with: '1.2.1'.
	
	spec 
		package: 'Soup-Core' with: 'Soup-Core-StephaneDucasse.6'; 
		package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-StephaneDucasse.2';
		package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.2' ].