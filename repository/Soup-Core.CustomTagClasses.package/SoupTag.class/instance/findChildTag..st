finding tags
findChildTag: anObject
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [
		:aTag |
		(findBlock value: aTag)  ifTrue: [^ aTag].
	].
	^ nil