finding tags
createFindTagBlock: anObject
  (anObject isKindOf: Boolean)
    ifTrue: [ ^ [ :aTag | anObject ] ].
  (anObject isString or: [ anObject isSymbol ])
    ifTrue: [ ^ [ :aTag | aTag name = anObject asString ] ].
  anObject isCollection
    ifTrue: [ 
      ^ [ :aTag | 
      | stringCol |
      stringCol := anObject collect: [ :each | each asString ].
      stringCol includes: aTag name ] ].
  ^ anObject