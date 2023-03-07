Class {
	#name : #BaselineOfAWS,
	#superclass : #BaselineOf,
	#category : 'BaselineOfAWS'
}

{ #category : #baselines }
BaselineOfAWS >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				package: 'Cryptography'
				with: [ spec repository: 'http://www.squeaksource.com/Cryptography' ].
			spec
				package: 'AWS-Core' with: [spec requires: #('Cryptography')];
				package: 'AWS-DynamoDB' with: [ spec requires: #('AWS-Core') ];
				package: 'AWS-Lambda' with: [ spec requires: #('AWS-Core') ];
				package: 'AWS-S3' with: [ spec requires: #('AWS-Core') ];
				package: 'AWS-ElasticTranscoder' with: [ spec requires: #('AWS-Core') ];
				package: 'AWS-STS' with: [ spec requires: #('AWS-Core') ];
				package: 'AWS-CloudFront' with: [ spec requires: #('AWS-Core') ];
				package: 'AWS-SNS' with: [ spec requires: #('AWS-Core')].
			spec 
				group: 'default' with: #('AWS-Core' 'AWS-DynamoDB' 'AWS-Lambda' 'AWS-S3' 'AWS-ElasticTranscoder' 'AWS-STS' 'AWS-CloudFront' 'AWS-SNS')].
]
