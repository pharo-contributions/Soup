baselines
baseline17: spec
  <version: '1.7-baseline'>
  spec
    for: #'squeakCommon'
    do: [ 
      spec blessing: #'baseline'.
      spec description: 'Using now XMLParser'.
      spec author: 'StephaneDucasse'.
      spec timestamp: '1/10/2013'.
      spec repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Soup/main'.
      spec
        package: 'Soup-Core' with: [ spec requires: 'XMLParser' ];
        package: 'Soup-Tests-Core' with: [ spec requires: 'Soup-Core' ];
        package: 'Soup-Help' with: [ spec requires: 'Soup-Core' ];
        package: 'Soup-XPath' with: [ spec requires: 'Soup-Core' ];
        package: 'Soup-Zinc' with: [ spec requires: 'Soup-Core' ].
      spec
        project: 'XMLParser'
        with: [ 
          spec
            className: 'ConfigurationOfXMLParser';
            versionString: #'stable';
            repository:
                'http://www.smalltalkhub.com/mc/PharoExtras/XMLParser/main' ].
      spec
        group: 'default' with: #('Core' 'Tests');
        group: 'Core' with: #('Soup-Core' 'Soup-XPath');
        group: 'Tests' with: #('Soup-Tests-Core') ].
  spec
    for: #'gemstone'
    do: [ 
      spec repository: 'http://www.smalltalkhub.com/mc/PharoExtras/Soup/main'.
      spec
        project: 'XMLSupport'
        with: [ 
          spec
            className: 'ConfigurationOfXMLSupport';
            versionString: #'stable';
            repository: 'http://squeaksource.com/MetacelloRepository' ].
      spec
        package: 'SoupGemstone-Core' with: [ spec requires: 'XMLSupport' ];
        package: 'Soup-Tests-Core' with: [ spec requires: 'SoupGemstone-Core' ];
        package: 'Soup-Help' with: [ spec requires: 'SoupGemstone-Core' ];
        package: 'Soup-XPath' with: [ spec requires: 'SoupGemstone-Core' ];
        package: 'Soup-Zinc' with: [ spec requires: 'SoupGemstone-Core' ].
      spec
        group: 'default' with: #('Core' 'Tests');
        group: 'Core' with: #('SoupGemstone-Core');
        group: 'Tests' with: #('Soup-Tests-Core') ]