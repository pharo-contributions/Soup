defaults
forHtml
	^ ForHtml ifNil: [
		ForHtml := self basicNew 
			initializeForHtml; 
			yourself
		]