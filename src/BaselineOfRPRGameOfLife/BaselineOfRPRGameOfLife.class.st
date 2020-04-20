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
			spec package: 'RPR-GameOfLife' ]
]

