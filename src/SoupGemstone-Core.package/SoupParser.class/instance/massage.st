massaging
massage
	string := self replace: '(<[^<>]*)/>' using: [:aMatcher | (aMatcher subexpression: 2) , '/>'].
	string := self replace: '<!\s+([^<>]*)>' using: [:aMatcher | '<!' , (aMatcher subexpression: 2) , '>'].
