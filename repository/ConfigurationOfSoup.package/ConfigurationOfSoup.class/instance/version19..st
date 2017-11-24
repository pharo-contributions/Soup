versions
version19: spec
	<version: '1.9' imports: #('1.9-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 1.9'.
		spec author: 'NouryBouraqadi'.
		spec timestamp: '11/24/2017 17:13'.
		spec project: 'XMLParser' with: '3.2.8'.
		spec 
			package: 'Soup-Core' with: 'Soup-Core-NouryBouraqadi.18';
			package: 'Soup-Zinc' with: 'Soup-Zinc-SeanDeNigris.1';
			package: 'Soup-XPath' with: 'Soup-XPath-TorstenBergmann.4';
			package: 'Soup-Help' with: 'Soup-Help-SeanDeNigris.3';
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-NouryBouraqadi.8';
			package: #'Soup-Tools' with: 'Soup-Tools-TorstenBergmann.1'. ].
