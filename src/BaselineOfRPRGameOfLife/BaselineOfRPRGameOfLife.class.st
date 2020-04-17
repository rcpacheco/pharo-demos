Class {
	#name : #BaselineOfRPRGameOfLife,
	#superclass : #BaselineOf,
	#category : #BaselineOfRPRGameOfLife
}

{ #category : #baselines }
BaselineOfRPRGameOfLife >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Dependencies"
			self brick: spec.

			"Packages"
			spec package: 'RPR-GameOfLife' with: [ spec requires: #('Brick') ] ]
]

{ #category : #accessing }
BaselineOfRPRGameOfLife >> brick: spec [
spec
project: 'Brick'
with: [ spec repository: 'github://feenkcom/Brick/src' ]
]

{ #category : #accessing }
BaselineOfRPRGameOfLife >> projectClass [
	^ MetacelloCypressBaselineProject
]
