Extension { #name : #HierarchicalURI }

{ #category : #'*AWS-Core' }
HierarchicalURI >> awsEncodeCanonicalUri [

	| path |
	path := self path.
	^ String streamContents: [ :stream | 
			(self path size = 1 and: [self path first = '/'])
				ifFalse: [stream nextPut: $/]
				ifTrue: [
					path do: [ :each | 
						stream nextPut: $/.
						each = '/' ifFalse: [ each printOn: stream ] ] ] ]
]
