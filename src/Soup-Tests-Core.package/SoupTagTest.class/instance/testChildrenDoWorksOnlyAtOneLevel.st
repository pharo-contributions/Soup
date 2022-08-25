enumerating
testChildrenDoWorksOnlyAtOneLevel
	"self debug: #testChildrenDoWorksOnlyAtOneLevel"
	| fatherTag grandFatherTag childOne childTwo |
	grandFatherTag := SoupTag new.
	fatherTag := SoupTag new.
	childOne := SoupTag new.
	childTwo := SoupString new.
	grandFatherTag addChild: fatherTag.
	fatherTag addChild: childOne.
	fatherTag addChild: childTwo.
	grandFatherTag childrenDo: [ :anElement |
		self deny: ({childOne. childTwo} includes: anElement) ].
	grandFatherTag childrenDo: [ :anElement |
		self assert: ({fatherTag} includes: anElement) ].