version
version01: spec 

	<version: '0.1'>
	spec 
			for: #common 
			do: [ spec repository: 'http://www.example.com/Soup'. 
					spec 
						package: 'Soup-Core' with: 'Soup-Core-StephaneDucasse.1'; 
						package: 'Soup-Tests-Core' with: 'Soup-Test-Core-StephaneDucasse.1';
						package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.1' ].