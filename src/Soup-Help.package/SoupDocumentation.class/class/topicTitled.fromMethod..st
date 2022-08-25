private
topicTitled: aString fromMethod: aSymbol

	^ HelpTopic
			title: aString
			contents: (self bodyOfMethodNamed: aSymbol).