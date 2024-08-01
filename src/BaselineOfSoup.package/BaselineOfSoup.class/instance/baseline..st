baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			package: 'Soup-Core' with: [
				spec includes: #('Soup-Platform-Pharo' ). ];
			package: 'Soup-Platform-Pharo' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-XPath' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-Help' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-Tests-Core' with: [
				spec requires: #('Soup-Core' ). ];
			package: #'Soup-Tools' with: [
				spec requires: #('Soup-Core' 'Soup-XPath'). ].
		spec 
			group: 'Tests' with: #('Soup-Tests-Core' );
			group: 'default' with: #('Core' 'Tests' 'Tools' );
			group: 'Core' with: #('Soup-Core' 'Soup-XPath' );
			group: 'Tools' with: #(#'Soup-Tools' ). ].
			
	spec for: #(#'pharo8.x') do: [
		spec 
			"Create an alias "
			package: 'Soup-Platform-Pharo' with: 'Soup-Platform-PharoPre9' ].
		
	spec for: #notGToolkit do: [
		spec baseline: 'XMLParser' with: [
			spec repository: 'github://pharo-contributions/XML-XMLParser:v3.x.x' ].
		spec package: 'Soup-Core' with: [
			spec requires: #('XMLParser' ). ] ].

	spec for: #GToolkit do: [
		spec package: 'Soup-GToolkit' with: [
			spec requires: #('Soup-Core' ). ] ].
