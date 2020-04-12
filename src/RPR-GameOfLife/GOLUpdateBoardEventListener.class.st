Class {
	#name : #GOLUpdateBoardEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'cellsToToggle'
	],
	#category : #'RPR-GameOfLife-Events'
}

{ #category : #accessing }
GOLUpdateBoardEventListener >> cellsToToggle [
	^ cellsToToggle
]

{ #category : #accessing }
GOLUpdateBoardEventListener >> cellsToToggle: anObject [
	cellsToToggle := anObject
]
