finding tags
findTag: anObject
	| findBlock |
	findBlock := self createFindTagBlock: anObject.
	self childTagsDo: [
		:aTag |
		| found |
		(findBlock value: aTag) 
			ifTrue: [^ aTag].
		found := (aTag findTag: findBlock).
		found ifNotNil: [^ found]
	].
	^ nil