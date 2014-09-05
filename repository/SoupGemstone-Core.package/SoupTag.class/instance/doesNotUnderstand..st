error handling
doesNotUnderstand: aMessage
  " Treat only unary messages as short hand attribute or child access."

  aMessage arguments size > 0
    ifTrue: [ ^ super doesNotUnderstand: aMessage ].
  attributes at: aMessage selector asString ifPresent: [ :aString | ^ aString ].
  self findTag: aMessage selector ifPresent: [ :aTag | ^ aTag ].
  ^ nil