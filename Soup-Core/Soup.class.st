"
Soup is the main public class of the package. It is the class to interact with as shown by the tests.

The best way to get started is to get a soup of html elements using fromString: as follows:

	Soup fromString: 'http://www.bedetheque.com/album-105582-BD-Atomium-Express.html' asUrl retrieveContents contentStream



"
Class {
	#name : #Soup,
	#superclass : #SoupTag,
	#category : #'Soup-Core-Base'
}

{ #category : #licensing }
Soup class >> License [
" Licensed like BeautifulSoup (see Soup OriginalLicense) "
	self error: 'comment only'
]

{ #category : #licensing }
Soup class >> OriginalLicense [
"Copyright (c) 2004-2007, Leonard Richardson

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

  * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.

  * Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following
    disclaimer in the documentation and/or other materials provided
    with the distribution.

  * Neither the name of the the Beautiful Soup Consortium and All
    Night Kosher Bakery nor the names of its contributors may be
    used to endorse or promote products derived from this software
    without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
""AS IS"" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE, DAMMIT.

"
	self error: 'comment only'
]

{ #category : #defaults }
Soup class >> defaultName [
	^ '[document]'
]

{ #category : #defaults }
Soup class >> defaultParserParameters [
	^ SoupParserParameters forHtml
]

{ #category : #'instance creation' }
Soup class >> fromString: aString [
	^ (SoupParser parameters: self defaultParserParameters) 
		parseString: aString
]

{ #category : #'instance creation' }
Soup class >> fromUrl: urlObject [

	^ self fromString: urlObject asUrl retrieveContents.

]

{ #category : #'instance creation' }
Soup class >> new [
	^ super new
		name: self defaultName;
		yourself
]

{ #category : #accessing }
Soup >> addChild: aChild [
	^ children add: aChild
]

{ #category : #'error handling' }
Soup >> doesNotUnderstand: aMessage [
	" Treat only unary messages as short hand child access. "
	(aMessage arguments size > 0)
		ifTrue: [^ super doesNotUnderstand: aMessage].
	self 
		findTag: aMessage selector
		ifPresent: [:aTag | ^ aTag].
	^ nil
]

{ #category : #initialization }
Soup >> initialize [
	super initialize.
	self name = '[document]'
]

{ #category : #testing }
Soup >> isSoup [
	^ true
]

{ #category : #printing }
Soup >> printOn: aStream [
	self childrenDo: [
		:eachElement |
		eachElement printOn: aStream.
	].

]
