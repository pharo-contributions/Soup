version
version02: spec 

	<version: '0.2'> 
	spec for: #common do: [ spec repository: 'http://www.squeaksource.com/Soup'. 
	spec 
		package: 'Soup-Core' with: 'Soup-Core-sd.10'; 
		package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-sd.3';
		package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.2' ].