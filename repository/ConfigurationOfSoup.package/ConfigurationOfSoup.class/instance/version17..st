versions
version17: spec
	<version: '1.7' imports: #('1.7-baseline')>
	spec
		for: #common do: [ 
			spec blessing: #release.
			spec description:
					'- Make former Pharo 2.0 package set the default i.e. common. Works for Pharo 3.0, should work for Squeak. May need Soup-Zinc on Pharo 1.4
					- Update to baseline 1.6, which changes the repo on gemstone'.
			spec author: ''.
			spec timestamp: '04/14/2014 11:27'.
			spec
				package: 'Soup-Core' with: 'Soup-Core-SeanDeNigris.15';
				package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-SeanDeNigris.7';
				package: 'Soup-Help' with: 'Soup-Help-SeanDeNigris.3';
				package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3' ].
			
	spec for: #gemstone do: [ spec package: 'SoupGemstone-Core' with: 'SoupGemstone-Core-PaulDeBruicker.1' ]