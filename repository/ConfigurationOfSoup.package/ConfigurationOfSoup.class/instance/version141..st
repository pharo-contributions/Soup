versions
version141: spec
  <version: '1.4.1' imports: #('1.4-baseline')>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'Soup-Core' with: 'Soup-Core-CamilloBruni.14';
        package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-AlexandreBergel.5';
        package: 'Soup-Help' with: 'Soup-Help-SeanDeNigris.3';
        package: 'Soup-XPath' with: 'Soup-XPath-CamilloBruni.3';
        package: 'Soup-Zinc' with: 'Soup-Zinc-SeanDeNigris.1' ].
  spec
    for: #'gemstone'
    do: [ 
      spec blessing: #'stable'.
      spec description: 'Get GemStone running a little better'.
      spec author: 'Paul DeBruicker'.
      spec timestamp: '11/28/2016 15:49PST'.
      spec project: 'XMLSupport' with: #'stable'.
      spec
        package: 'Soup-Tests-Core' with: 'Soup-Tests-Core-PaulDeBruicker.6';
        package: 'SoupGemstone-Core' with: 'SoupGemstone-Core-PaulDeBruicker.3' ]