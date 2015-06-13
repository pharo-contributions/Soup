instance creation
named: aString parent: aSoup previous: aSoupString attributes: aDictionary 
	| class instance |
	class := self subclasses
		detect: [ :e | e isClassForTagNamed: aString parent: aSoup previous: aSoupString attributes: aDictionary ]
		ifNone: [ self ].
	instance := class named: aString parent: aSoup previous: aSoupString.
	aDictionary keysAndValuesDo: [ :key :value |
		instance attributeAt: key put: value ].
	^ instance