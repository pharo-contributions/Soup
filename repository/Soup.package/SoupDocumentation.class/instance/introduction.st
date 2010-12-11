documentation
introduction

	^ ' Soup is a HTML/XML parser designed for quick turnaround projects like screen-scraping. Three features make it powerful:

 Soup won''t choke if you give it bad markup. It yields a parse tree that makes approximately as much sense as your original document. This is usually good enough to collect the data you need and run away.

 Soup provides a few simple methods and idioms for navigating, searching, and modifying a parse tree: a toolkit for dissecting a document and extracting what you need. You don''t have to create a custom parser for each application.

 Soup automatically converts incoming documents to Unicode and outgoing documents to UTF-8. You don''t have to think about encodings, unless the document doesn''t specify an encoding and  Soup can''t autodetect one. Then you just have to specify the original encoding.

 Soup parses anything you give it, and does the tree traversal stuff for you.'