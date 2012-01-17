version
version10: spec
	<version: '1.1' imports: #('1.1-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'development'.
		spec project: 'XMLSupport' with: [
				spec
					versionString: '1.2.0';
					loads: #('XML-Parser' 'XML-Tests-Parser' ) ].
		spec 
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-AlexandreBergel.5';
			package: 'Soup-Help' with: 'Soup-Help-StephaneDucasse.2';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'. ].
