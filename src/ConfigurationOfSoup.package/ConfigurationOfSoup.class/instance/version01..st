versions
version01: spec 

	<version: '0.1'> 
	spec for: #common do: [ spec repository: 'http://www.squeaksource.com/Soup'. 
	spec 
		package: 'Soup-Core' with: 'Soup-Core-StephaneDucasse.6'; 
		package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-StephaneDucasse.2';
		package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.2' ].