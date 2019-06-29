Class {
	#name : #BaselineOfSoup,
	#superclass : #BaselineOf,
	#category : #BaselineOfSoup
}

{ #category : #baselines }
BaselineOfSoup >> baseline: spec [
	<baseline>

	"
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Soup/main'.
		spec project: 'XMLParser' with: [
				spec
					className: #ConfigurationOfXMLParser;
					versionString: #'stable';
					repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main' ]."
	spec
		for: #pharo
		do: [ spec configuration: 'XMLParser' 
				with: [ spec
					versionString: 'stable';
					repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main' ].			
		spec 
			package: 'Soup-Core' with: [
				spec requires: #('XMLParser' ). ];
			package: 'Soup-Zinc' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-XPath' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-Help' with: [
				spec requires: #('Soup-Core' ). ];
			package: 'Soup-Tests-Core' with: [
				spec requires: #('Soup-Core' ). ];
			package: #'Soup-Tools' with: [
				spec requires: #('Soup-Core' 'Soup-Zinc' 'Soup-XPath' 'Soup-Help' ). ].
		spec 
			group: 'Tests' with: #('Soup-Tests-Core' );
			group: 'default' with: #('Core' 'Tests' 'Tools' );
			group: 'Core' with: #('Soup-Core' 'Soup-XPath' );
			group: 'Tools' with: #(#'Soup-Tools' ). ].

]
