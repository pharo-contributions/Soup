baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Soup-Core';
			package: 'Soup-XPath' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-Help' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-Tests-Core' with: [
				spec requires: #('Soup-Core' ). ];
			package: #'Soup-Tools' with: [
				spec requires: #('Soup-Core' 'Soup-XPath' 'Soup-Help' ). ].
		spec 
			group: 'Tests' with: #('Soup-Tests-Core' );
			group: 'default' with: #('Core' 'Tests' 'Tools' );
			group: 'Core' with: #('Soup-Core' 'Soup-XPath' );
			group: 'Tools' with: #(#'Soup-Tools' ). ].
			
	spec for: #notGToolkit do: [
		spec baseline: 'XMLParser' with: [
			spec repository: 'github://pharo-contributions/XML-XMLParser' ].
		spec package: 'Soup-Core' with: [
			spec requires: #('XMLParser' ). ] ].
