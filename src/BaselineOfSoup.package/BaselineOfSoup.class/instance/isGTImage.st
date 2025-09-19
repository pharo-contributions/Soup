testing
isGTImage
	| organiserClass |

	organiserClass := Smalltalk classNamed: 'PackageOrganizer'.
	organiserClass ifNil: [ organiserClass := Smalltalk classNamed: 'RPackageOrganizer' ].
	
	"Implementation note: used to check for GToolkit prefix, but P7 has a 
	 GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"		
	^ organiserClass default packageNames 
		anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ]
