baselines
baseline14: spec 
	<version: '1.4-baseline'> 
	
	spec for: #pharo do: [ 
		spec blessing: #baseline.
		spec description: 'Migrated to SmalltalkHub'. 
		spec author: 'StephaneDucasse'.
		spec timestamp: '21/02/2013'.
		spec repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Soup/main'.
		
		spec 
			package: 'Soup-Core' with: [spec requires: 'XMLSupport' ];
			package: 'Soup-Tests-Core' with: [spec requires: 'Soup-Core'] ;
			package: 'Soup-Help' with: [spec requires: 'Soup-Core'];
			package: 'Soup-XPath' with: [spec requires: 'Soup-Core'].
			
		spec project: 'XMLSupport' with: [
			spec className: 'ConfigurationOfXMLSupport';
			versionString: #stable;
			repository: 'http://www.squeaksource.com/XMLSupport'.
			].
		
		spec
			group: 'default' with: #('Core' );
			group: 'Core' with: #('Soup-Core' 'Soup-XPath' 'Soup-Tests-Core')
			].
		
	spec for: #zinc do: [
		spec 
			package: 'Soup-Zinc';
			package: 'Soup-Core' with: [spec includes: 'Soup-Zinc' ]. ]
	