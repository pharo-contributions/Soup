versions
version18: spec
	<version: '1.8' imports: #('1.8-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.8'.
		spec author: 'TorstenBergmann'.
		spec timestamp: '4/14/2016 12:35'.
		spec project: 'XMLParser' with: '2.7.5'.
		spec 
			package: 'Soup-Core' with: 'Soup-Core-TorstenBergmann.17';
			package: 'Soup-Zinc' with: 'Soup-Zinc';
			package: 'Soup-XPath' with: 'Soup-XPath-TorstenBergmann.4';
			package: 'Soup-Help' with: 'Soup-Help';
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-SeanDeNigris.7';
			package: 'Soup-Tools' with: 'Soup-Tools-TorstenBergmann.1'. ].
