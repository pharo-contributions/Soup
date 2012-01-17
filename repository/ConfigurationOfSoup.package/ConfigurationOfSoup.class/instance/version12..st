versions
version12: spec
	<version: '1.2' imports: #('1.1-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'baseline'.
		spec description: 'Adding Camillo Bruni XPath extension'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '31/12/2011 12:29'.
		spec project: 'XMLSupport' with: #'stable'.
		spec 
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-AlexandreBergel.5';
			package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.2';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'. ].
