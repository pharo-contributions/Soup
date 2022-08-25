tests
testEntitiesInAttributeValues
	| uri link |
	self assertSoupFrom: '<x t="x&#241;">' printsAs: '<x t="xñ"></x>'.
	self assertSoupFrom: '<x t="x&#xf1;">' printsAs: '<x t="xñ"></x>'.
	uri := 'http://crummy.com?sacr&eacute;&amp;bleu'.
	link := '<a href="{1}"></a>' format: uri.
	self assertSoupFrom: link printsAs: link.

