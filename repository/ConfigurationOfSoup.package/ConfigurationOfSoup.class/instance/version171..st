versions
version171: spec
	<version: '1.7.1' imports: #('1.7-baseline')>
	spec
		for: #common do: [ 
			spec blessing: #release.
			spec description:
					'Bugfix'.
			spec author: 'StephanEggermont'.
			spec timestamp: '2015-12-14'.
			spec
				package: 'Soup-Core' with: 'Soup-Core-SeanDeNigris.16';
				package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-SeanDeNigris.7';
				package: 'Soup-Help' with: 'Soup-Help-SeanDeNigris.3';
				package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3' ].
			
	spec for: #gemstone do: [ spec package: 'SoupGemstone-Core' with: 'SoupGemstone-Core-PaulDeBruicker.1' ]