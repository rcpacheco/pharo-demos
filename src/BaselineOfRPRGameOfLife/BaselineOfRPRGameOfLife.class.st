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
			"Packages"
			spec package: 'RPR-GameOfLife' with: [ spec requires: #('Brick') ] ]
]

{ #category : #accessing }
BaselineOfRPRGameOfLife >> projectClass [
	^ MetacelloCypressBaselineProject
]
