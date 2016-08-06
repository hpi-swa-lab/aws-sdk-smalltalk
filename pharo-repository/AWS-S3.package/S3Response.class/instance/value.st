accessing
value
	| result exception |
	(self response hasEntity and:[ self response contentType sub = 'xml'])
			ifTrue:[ result := XMLDOMParser parse: self response contents readStream. ]
			ifFalse:[ result := self response contents. ].
	self response isSuccess 
		ifTrue:[ ^ result ].
	
	exception := self defaultExceptionClass new.
	exception properties: result.
	exception messageText: (result firstNode contentStringAt:'Code').
	exception signal.