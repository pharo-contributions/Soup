versions
version13: spec
	<version: '1.3' imports: #('1.3-baseline' )>

	spec for: #'pharo' do: [
		spec blessing: #'development'.
		spec description: '- New Help version
- Fix for Pharo 2.0.'.
		spec author: 'SeanDeNigris'.
		spec timestamp: '08/02/2013 11:27'.
		spec project: 'XMLSupport' with: #'stable'.
		spec 
			package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-AlexandreBergel.5';
			package: 'Soup-Help' with: 'Soup-Help-SeanDeNigris.3';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'. ].

	spec for: #'pharo2.x' do: [
		spec blessing: #'development'.
		spec description: '- New Help version
- Fix for Pharo 2.0.'.
		spec author: 'SeanDeNigris'.
		spec timestamp: '08/02/2013 11:27'.
		spec project: 'XMLSupport' with: #'stable'.
		spec 
			package: 'Soup-Core' with: 'Soup-Core-SeanDeNigris.15';
			package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-SeanDeNigris.7';
			package: 'Soup-Help' with: 'Soup-Help-SeanDeNigris.3';
			package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3'. ].
		
	spec for: #zinc do: [
		spec 
			package: 'Soup-Zinc-SeanDeNigris.1' ]