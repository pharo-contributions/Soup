testing
isGTImage
	
	Smalltalk globals at: #RPackageOrganizer ifPresent: [ :p | ^ p default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ]].
	Smalltalk globals at: #PackageOrganizer ifPresent: [ :p | ^ p default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ]].	
	^ false.
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"