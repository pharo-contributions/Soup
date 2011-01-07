accessing
string: anObject
	self reset.
	string := anObject.
	self detectEncoding.